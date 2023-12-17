*** Settings ***
Library     SeleniumLibrary
Resource    ../../PageObjects/MainPage.robot
Resource    ../../PageObjects/DiscountsPage.robot
Resource    ../../Resources/Testdata.robot
Library     DateTime
Library     String
Library     Collections

*** Keywords ***
Choose Random Record in the table
    Wait until page contains element     ${table}
    ${elementCount}      Get Element Count        ${tableRow}
    ${randomNumberInRange}    Evaluate  random.randint(1, ${elementCount})
    return from keyword    ${randomNumberInRange}

Define Relevant Table Data element in Table
    [Arguments]    ${arg1}    ${arg2}
    ${thNumber}=    Get Element Count    ${tableTHead}
    @{list} =	Create List
    ${i}=  set variable    1
    ${columnPosition}=    Set Variable    0
    sleep    2

#get every column name, to get the column position where the value we are filtering for needs to be checked
    FOR    ${i}    IN RANGE    ${thNumber}
        ${cycleLimit}=    Evaluate    ${thNumber}+1
        ${i}=    Evaluate    ${i}+1
        EXIT FOR LOOP IF    ${i} == ${cycleLimit}

        ${tableTHeadNumbered}=    CATENATE    SEPARATOR=    ${tableTHead}  [${i}]
        ${tHeadAttribute}=        Get Element Attribute     ${tableTHeadNumbered}    ${data-name}
        Append to List    ${list}    ${tHeadAttribute}

        ${columnPosition}=    Get Index From List   ${list}    ${arg2}
        ${columnPosition}=    Evaluate    ${columnPosition}+1
    END

#   form xpath for the first row in the table where we will get the value from its relevant column & row TD html element
    ${randomRowFirstTD}    CATENATE    SEPARATOR=    ${tableRow}  [1]    ${tableData}    [  ${columnPosition}  ]
    Element Should Contain    ${randomRowFirstTD}        ${arg1}      ${None}     ${True}
    [Return]    ${randomRowFirstTD}

Single Filter
    [Arguments]    ${arg1}    ${arg2}
    Wait until page contains element     ${singleFilter_field}
    Click Element                        ${singleFilter_field}
    Press Keys                           ${singleFilter_field}        ${arg2}     RETURN
    Input Text                           ${singleFilterInputField}    ${arg1}
    Click Button                         ${filterBtn}

Single filter & Confirm
    [Arguments]      ${arg1}    ${arg2}
    Single Filter    ${arg1}    ${arg2}
    Wait Until Element Contains                    ${table}   ${arg1}
    Define Relevant Table Data element in Table    ${arg1}    ${arg2}

Single filter & Confirm Element is Deleted
    [Arguments]      ${arg1}    ${arg2}
    Click Element    ${switchToSingleFilter}
    Wait Until Element is not visible            ${tableSpinner}
    Single Filter    ${arg1}    ${arg2}
    Wait Until Element is not visible            ${tableSpinner}
    Wait Until Element Does Not Contain          ${table}              ${arg1}
    Wait Until Element Contains                  ${table}              ${tableIsEmpty}

Filter by Advanced filter
    [Arguments]    ${arg1}
    ${boolean}=      Run Keyword And Return Status       Wait Until Element Is Visible      ${advanced_Filter_Element}    5s
    IF    ${boolean} == True
        Click element    ${advanced_Filter_Element}
        Wait until element is enabled        ${advancedNameInput}
    END
    Input text                           ${advancedNameInput}           ${arg1}
    Click button                         ${filterBtn}

Advanced filter & Confirm element is there
    [Arguments]    ${arg1}    ${arg2}
    Filter by Advanced filter    ${arg1}
    sleep    2
    ${randomRowFirstTD}=    Define Relevant Table Data element in Table    ${arg1}    ${arg2}
    Wait until element is not visible    ${tableSpinner}
    Wait Until Element Contains          ${table}                   ${arg1}
#   Element Should Contain has 4 args, of which: ${None} vrakja None, a ${True} e True
    Element Should Contain               ${randomRowFirstTD}        ${arg1}      ${None}     ${True}

#Advanced filter & Confirm element is not there
#    [Arguments]    ${arg1}
#    Filter by Advanced filter    ${arg1}
#    Wait Until Element is not visible            ${tableSpinner}
#    Wait Until Element Does Not Contain          ${table}              ${arg1}
#    Wait Until Element Contains                  ${table}              ${tableIsEmpty}

Change the filter type
# check which filter was last used and switch to the other one
    [Arguments]     ${arg1}
    ${boolean}=      Run Keyword And Return Status       Page should contain element      ${switchToSingleFilter}
    IF    ${boolean} == True
        Click element    ${switchToSingleFilter}
        Wait until element is not visible               ${tableSpinner}
        Element Should Be Disabled                      ${singleFilterInputField}
        Element Should Not Contain                      ${singleFilterInputField}       ${arg1}
    ELSE
        Click element    ${advanced_Filter_Element}
        Wait until element is not visible               ${tableSpinner}
        Element Should Not Contain                      ${advancedNameInput}            ${arg1}
    END


Verify Paging Number
    ${showingNumberOfRecords}=    Get Text    ${showingNumberOfRecordsSpan}
    ${totalNumberOfRecords}=    Get Text    ${totalNumberOfRecordsSpan}
    ${pagesNumberShouldBe}=   Evaluate    math.ceil( ${totalNumberOfRecords}    /    ${showingNumberOfRecords} )
#    ${pagesNumberShouldBe}=   Evaluate    ${totalNumberOfRecords}    /    ${showingNumberOfRecords}
#    ${pagesNumberShouldBe}=   Evaluate    ${totalNumberOfRecords}    /    ${showingNumberOfRecords}

    ${paginationListItemsNumber}=    Get Element Count    ${paginationListItems}
    ${paginationListItemsNumber}=   Evaluate   ${paginationListItemsNumber}-2
    IF    ( ${pagesNumberShouldBe} == ${paginationListItemsNumber} )
       Page Should Contain Element    ${paginationSingleListItem}    limit=
    END