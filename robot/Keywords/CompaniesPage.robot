*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/MainPage.robot
Resource    ../PageObjects/CompaniesPage.robot
Resource    ../Resources/Testdata.robot

*** Keywords ***
Navigate to Companies Page
    wait until element is visible        ${companiesSideBarBtn}
    click element                        ${companiesSideBarBtn}
    location should be                   ${companiesUrlPath}

Add a new company
    Page should contain button           ${createCompanyBtn}
    click button                         ${createCompanyBtn}
    wait until location is               ${createCompanyUrl}
    wait until element is visible        ${CreateCompanyTitle_text}
    Page Should Contain Element          ${createCompanyForm}

Filter Company by Advanced filters
     [Arguments]    ${arg1}

    Click element    ${advanced_Filter}
    Input text       ${nameInput}              ${arg1}
    Click button     ${filterBtn}
    wait until element contains    ${table}                 ${arg1}
#    Click Element       ${singleFilter_field}
#    Press Keys          ${singleFilter_field}   Name    RETURN
#    Input Text          ${singleFilterInputField}       ${arg1}
#    Click Element       ${filterBtn}
#    Sleep    2
#    wait until element contains    ${table}       ${arg1}



#Choose Random Record in the table
#    Wait until page contains element     ${table}
#    ${elementCount}      Get Element Count        ${tableRow}
#    ${randomNumberInRange}    Evaluate  random.randint(1, ${elementCount})
#    return from keyword    ${randomNumberInRange}
#
Single filter & Confirm
    [Arguments]    ${arg1}
    Wait until page contains element     ${singleFilter_field}
    click element                        ${singleFilter_NameField}
    Press Keys                           ${singleFilter_NameField}        ${filterName}           RETURN
    Input Text                           ${singleFilterInputField}    ${arg1}
    Click Element                        ${filterBtn}
    wait until element contains          ${table}                     ${arg1}
#    sleep    2
#    ${randomRecord}    Choose Random Record in the table
#    ${randomRowFirstTD}    CATENATE    SEPARATOR=    ${tableRow}  [  ${randomRecord}  ]    ${firstTD}
#    Element Should Contain               ${randomRowFirstTD}        ${arg1}      ${None}     ${True}
#
#Advanced filter & Confirm element is there
#    [Arguments]     ${arg1}
#    Filter by Advanced filter            ${arg1}
#    sleep    2
#    ${randomRecord}    Choose Random Record in the table
##   form xpath for a random row in the table where the we will get the value from its first TD html element
#    ${randomRowFirstTD}    CATENATE    SEPARATOR=    ${tableRow}  [  ${randomRecord}  ]    ${firstTD}
##    Wait until element is not visible    ${tableSpinner}
##   Element Should Contain has 4 args, of which: ${None} e bukvalno None, a ${True} e true. P.S. ctrl + click na varijablite za da gi vidis kako i kade se definirani
#    Element Should Contain              ${randomRowFirstTD}        ${arg1}      ${None}     ${True}

Advanced filter & Confirm element is not there
    [Arguments]     ${arg1}
    Click element    ${advanced_Filter}
    Input text       ${nameInput}              ${arg1}
    Click button     ${filterBtn}
    Wait until element is not visible            ${tableSpinner}
    Wait Until Element Does Not Contain          ${table}       ${arg1}

Reset Advanced filter
    [Arguments]     ${arg1}
    Click Button                                     ${resetBtn}
    Wait until element is not visible                ${tableSpinner}
    Element Should Not Contain                       ${singleFilterInputField}       ${arg1}

Create Company
    wait until element is visible        ${nameInput}
    wait until element is visible        ${vatInput}
    wait until element is visible        ${createBtn}
    sleep       3
    wait until page contains element     ${ImageInput}
    Input text                           ${nameInput}           ${mockTestCompanyName}
    Input text                           ${vatInput}            ${mockTestCompanyVat}
    Choose File                          ${ImageInput}          ${ImageExample}        # smeni ja patekata :)
    Click button                         ${createBtn}
    wait until element is not visible    ${tableSpinner}
    wait until location is               ${companiesUrlPath}
    wait until page contains             Successfully created company!

Create Company with missing mandatory values
    wait until element is visible        ${nameInput}
    wait until element is visible        ${vatInput}
    wait until element is visible        ${createBtn}
    wait until page contains element     ${ImageInput}
   # Input text                           ${nameInput}           ${mockTestCompanyName}
    Input text                           ${vatInput}            ${mockTestCompanyVat}
    Choose File                          ${ImageInput}          ${ImageExample}        # smeni ja patekata :)
    Click button                         ${createBtn}
    location should be                   ${createCompanyUrl}
    wait until element is visible        ${CompanyName_errorMsg}

Create Company with duplicate name
    wait until element is visible        ${nameInput}
    wait until element is visible        ${vatInput}
    wait until element is visible        ${createBtn}
    sleep       3
    wait until page contains element     ${ImageInput}
    Input text                           ${nameInput}           ${mockTestCompanyName}
    Input text                           ${vatInput}            ${mockTestCompanyVat}
    Choose File                          ${ImageInput}          ${ImageExample}        # smeni ja patekata :)
    Click button                         ${createBtn}
    sleep       3
    location should be                   ${createCompanyUrl}

Navigate to Edit Company page
    Wait until element is not visible    ${tableSpinner}
#    ${randomNumberInRange}    Choose Random Record in the table
#    ${randomEditXpathElement}    Catenate   SEPARATOR=	  ${editBtn}    [    ${randomNumberInRange}    ]
#    Click element                         ${randomEditXpathElement}
    click element                        ${editBtn}
    wait until element is visible       ${EditCompanyTitle_text}

Update an existing company
    [Arguments]     ${arg1}
    wait until element is not visible    ${tableSpinner}
    Input text                           ${nameInput}           ${arg1}
    sleep       2
    Input text                           ${vatInput}            15
    sleep       2
    click button                         ${updateBtn}
    wait until element is not visible    ${tableSpinner}
    wait until location is               ${companiesUrlPath}
    wait until page contains             Successfully updated Company data!

Update an existing company with missing mandatory values
    wait until element is not visible    ${tableSpinner}
    click element                        ${nameInput}
    Press Keys                           ${nameInput}     CTRL+A+DELETE
    sleep       2
    click button                         ${updateBtn}
    wait until element is not visible    ${tableSpinner}
    page should contain element          ${editcompanytitle_text}
    wait until element is visible        ${CompanyName_errorMsg}

Delete the Company
#    ${randomNumberInRange}    Choose Random Record in the table
#    ${randomDeleteXpathElement}    Catenate   SEPARATOR=	  ${deleteRowBtn}    [    ${randomNumberInRange}    ]
#    Wait until element is not visible           ${tableSpinner}
#    Click element                               ${randomDeleteXpathElement}
    wait until element is visible               ${deleteBtn}
    click element                               ${deleteBtn}
    wait until element is visible               ${confirmationModal}
    Element should contain                      ${confirmBtn}      CONFIRM
    Element should contain                      //button[@type="button" and contains (., "Cancel")]       CANCEL
    Click button                                ${confirmBtn}
    wait until element is not visible           ${tableSpinner}
    wait until location is                      ${companiesUrlPath}
    wait until page contains                    Successfully deleted company!
Choose to delete company and cancel deletion
    wait until element is visible               ${deleteBtn}
    click element                               ${deleteBtn}
    wait until element is visible               ${confirmationModal}
    Element should contain                      ${confirmBtn}      CONFIRM
    Element should contain                      ${cancel_Btn}       CANCEL
    Click button                                ${cancel_Btn}      CANCEL
    sleep     2
    wait until element is not visible           ${confirmationModal}
    wait until element is not visible           ${tableSpinner}
    wait until location is                      ${companiesUrlPath}


