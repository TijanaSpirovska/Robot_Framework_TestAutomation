*** Settings ***

Library     SeleniumLibrary
Resource    ../PageObjects/MainPage.robot
Resource    ../PageObjects/DiscountsPage.robot
Resource    ../Resources/Testdata.robot
Resource    Core/Engine.robot
Library     DateTime
Library     String
Resource    ../Keywords/Common.robot
Resource    ../PageObjects/UsersPage.robot


*** Keywords ***

Go to Discounts Page
    Wait until page contains element     ${discountsSideBarBtn}
    click element                        ${discountsSideBarBtn}
    location should be                   ${discountsUrlPath}

Go To Create Discount Page
    Wait until page contains element     ${createDiscountBtn}
    Click button                         ${createDiscountBtn}
    Location Should Be                   ${createDiscountUrlPath}
    Page Should Contain Element          ${createBtn}

Create Discount
    Page Should Contain Element          ${createBtn}
    Input Text                           ${nameInput}                       ${mockTestDiscountName}
    Input Text                           ${discountPriorityInput}           ${mockTestDiscountPriority}     clear = True
    Click Element                        ${typesInput}
    Press Keys                           ${typesInput}                      ${percentageDropdown}           RETURN
    Input Text                           ${valueInput}                      ${Discount_Value}

    Input Text                           ${active_fromInput}               ${ActiveFrom_Discount}


    Input Text                           ${active_toInput}                  ${ActiveTo_Discount}


    Click Button                         ${newRuleBtn}
    Wait Until Element Is Enabled        ${inputSelectField}
    Input Text                           ${inputSelectField}                ${mockTestRuleSearch}
    Press Keys                           ${inputSelectField}                ENTER
    Input Text                           ${enterProductName}                a
    sleep                                2
    Press Keys                           ${enterProductName}                ENTER
    Input Text                           ${productQuantity}                 3
    Click Button                         ${createBtn}
    sleep                                2
    Page Should Contain                  ${CreatedDiscount_Msg}
    Wait until location is               ${discountsUrlPath}
Create Discount with missing mandatory fields
    Click Element                        ${editBtn}
    sleep                                2
    Click Element                        ${nameInput}
    Press Keys                           ${nameInput}        CTRL+A+DELETE
    Click Element                        ${valueInput}
    Press Keys                           ${valueInput}       CTRL+A+DELETE
    Click Element                        ${discountPriorityInput}
    Press Keys                           ${discountPriorityInput}   CTRL+A+DELETE
    Click Element                        ${active_fromInput}
    Press Keys                           ${active_fromInput}        CTRL+A+DELETE
    Click Element                        ${active_toInput}
    Press Keys                           ${active_toInput}           CTRL+A+DELETE
    Click Button                         ${updateBtn}
    sleep                                1
Verify Discount is not created
    Wait Until Element Is Visible                      ${ErrorMsg_Name}
    Wait Until Element Is Visible                   ${ErrorMsg_Priority}
    Wait Until Element Is Visible                   ${ErrorMsg_Value}
    Wait Until Element Is Visible                    ${ErrorMsg_Activefrom}
    Wait Until Element Is Visible                    ${ErrorMsg_Activeto}
    Wait Until Element Is Visible                   ${ErrorMsg_Conditions}


Edit Discount
    Click Element                         ${editBtn}
    sleep                                 2
    Wait until element is not visible     ${tableSpinner}
    Input Text     ${nameInput}        ${mockTestDiscountName2}      clear = True
    Input Text     ${discountPriorityInput}           ${mockTestDiscountPriority}    clear = True
    Input Text                           ${active_fromInput}                ${Active_from}
    Input Text                           ${active_toInput}                  ${Active_to}
    Click Button                         ${updateBtn}
    sleep                                3
    Page Should Contain                  ${UpdateDiscount_Msg}
    Wait until location is               ${discountsUrlPath}



Delete Discount
    Wait until element is not visible            ${tableSpinner}
#    ${randomNumberInRange}    Choose Random Record in the table
    ${randomDeleteXpathElement}    Catenate   SEPARATOR=	  ${deleteRowBtn}    [1]
    Click Element                                ${randomDeleteXpathElement}
    Wait Until Page contains element             ${confirmationModal}
    Element Should contain                       ${confirmBtn}          CONFIRM
    Element Should contain                       ${cancellBtn}           CANCEL
    Click Button                                 ${confirmBtn}
    Wait Until Element Does Not Contain          ${table}               ${tableIsEmpty}
    Wait Until Page Does Not Contain             ${confirmationModal}
    Wait Until Element Is Not Visible            ${tableSpinner}
    Sleep    1
    Page Should Contain    ${DeleteDiscount_Msg}
Verify Single filter is enabled
    Wait until page contains element    ${Single_filter}
    Element should be enabled           ${Single_filter}
Filter Discount by Name
    [Arguments]    ${arg1}
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Name    RETURN
    Input Text       ${NameFilter}        ${arg1}
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    ${arg1}
Filter Discount by Priority
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Priority    RETURN
    Input Text       ${PriorityFilter}         0
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    0
Filter Discount by Type
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Type    RETURN
    Click Element    ${TypeFilter}
    Press Keys       ${TypeFilter}      Percentige     RETURN
    Click Element    ${Filter_button}
    Sleep            2

Filter Discount by Value
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Value    RETURN
    Input Text       ${ValueFilter}        ${Discount_Value}
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    ${Discount_Value}
Filter Discount by Active from
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Active from    RETURN
    click element    ${Active_from_to}
    press keys       ${Active_from_to}     <
    Input text       ${Active_discount}    ${Active_from}
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    ${Active_from}
Filter Discount by Active to
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Active to   RETURN
    click element    ${Active_from_to}
    press keys       ${Active_from_to}     <
    Input text       ${Active_discount}   ${Active_to}
    Click Element    ${Filter_button}
    Sleep            2
Verify Advanced filter is enabled
    click element    ${Advanced_filter_Discount}
    Wait until page contains element   ${Filter_Advanced}
    Element should be enabled          ${Filter_Advanced}

Filter Discount by Name-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${FilterName_Advanced}
    Input Text       ${FilterName_Advanced}        ${mockTestDiscountName}
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    ${mockTestDiscountName}
    Click Element    ${FilterName_Advanced}
    Press Keys       ${FilterName_Advanced}          CTRL+A+DELETE

Filter Discount by Value-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${FilterValue_Advanced}
    Input Text       ${FilterValue_Advanced}        ${Discount_Value}
    Click Element    ${Filter_button}
    Sleep             2
    Page Should Contain    ${Discount_Value}
    Click Element    ${FilterValue_Advanced}
    Press Keys       ${FilterValue_Advanced}         CTRL+A+DELETE

Filter Discount by Priority-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${FilterPriority_Advanced}
    Input Text       ${FilterPriority_Advanced}       0
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    0
    Click Element    ${FilterPriority_Advanced}
    Press Keys       ${FilterPriority_Advanced}            CTRL+A+DELETE

Filter Discount by Active from-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${FilterActiveFrom_Advanced}
    Input Text       ${FilterActiveFrom_Advanced}    ${Active_from}
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    ${Active_from}
    Click Element    ${FilterActiveFrom_Advanced}
    Press Keys       ${FilterActiveFrom_Advanced}        CTRL+A+DELETE


Filter Discount by Active to-Advanced
    wait until page contains element    ${Filter_Advanced}
    click element    ${FilterActiveTo_Advanced}
    Input Text       ${FilterActiveTo_Advanced}         ${Active_to}
    Click Element    ${Filter_button}
    Sleep            2
    Click Element    ${FilterActiveTo_Advanced}
    Press Keys       ${FilterActiveTo_Advanced}       CTRL+A+DELETE
Filter Discount by Type - Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${FilterType_Advanced}
    Press Keys       ${FilterType_Advanced}    Percentige    RETURN
    Click Element    ${Filter_button}
    Sleep            2
Verify discount is deleted
    [Arguments]    ${arg1}
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Name    RETURN
    Input Text       ${NameFilter}        ${arg1}
    Click Element    ${Filter_button}
    sleep              2
    element should contain                ${table}           ${No_data}
    sleep           1
