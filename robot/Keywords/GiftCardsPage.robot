*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/GiftCardsPage.robot
Resource    ../PageObjects/MainPage.robot
Resource    ../Resources/Testdata.robot
Resource    ../PageObjects/DiscountsPage.robot


*** Keywords ***
Go to Gift Cards Page
    Wait until page contains element     ${discountsSideBarBtn}
    click element                        ${discountsSideBarBtn}
    click element                        ${giftCSideBarBtn}
    location should be                   ${giftCardsUrlPath}

Go To Create Gift Card Page
    Wait until page contains element     ${createGiftCBtn}
    click button                         ${createGiftCBtn}
    Location Should Be                   ${giftCardsCreateUrlPath}
    Page Should Contain Element          ${createGiftCFormTitle}

Choose Random Record in the table
    Wait until page contains element     ${table}
    ${elementCount}      Get Element Count        ${tableRow}
    ${randomNumberInRange}    Evaluate  random.randint(1, ${elementCount})
    return from keyword    ${randomNumberInRange}


Create Gift Card
    Page Should Contain Element          ${createBtn}
    Input Text                           ${totalAmount}                      100
    Input Text                           ${customerEmailField}                      ${GiftCard_email}
    Input text                           ${validFrom}                               ${Active_from}
    Input text                           ${validTo}                                 ${Active_to}
    Click button                         ${createBtn}
    Sleep                                2
    Page Should Contain                  ${CreateGiftCard_Msg}
    Wait until location is               ${giftCardsUrlPath}
    Wait until page contains element     ${createGiftCBtn}

Verify Single filter is enabled
    Wait until page contains element    ${Single_filter}
    Element should be enabled           ${Single_filter}
Filter GiftCard by Customer Email
    [Arguments]    ${arg1}
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Customer email    RETURN
    Input Text       ${CustomerEmail_Filter}       ${arg1}
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain        ${arg1}
Filter GiftCard by Total Amount
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Total amount    RETURN
    Input Text       ${TotalAmount_Filter}         150.00
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    150.00
Filter GiftCard by Status
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Status   RETURN
    Click Element    ${SelectStatus_Filter}
    Press Keys       ${SelectStatus_Filter}      Active     RETURN
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain       Active
Filter GiftCard by Redeem Amount
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Redeem amount    RETURN
    Input Text       ${RedeemAmount_Filter}        0
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain    0
Filter GiftCard by Valid from
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Valid from    RETURN
    click element    ${Active_from_to}
    press keys       ${Active_from_to}     =
    Input text       ${ValidFrom_to_Filter}    ${Active_from}
    Click Element    ${Filter_button}
    Sleep            2

Filter GiftCard by Valid to
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Valid to   RETURN
    click element    ${Active_from_to}
    press keys       ${Active_from_to}     =
    Input text       ${ValidFrom_to_Filter}   03/22/2025
    Click Element    ${Filter_button}
    Sleep            2

Verify Advanced filter is enabled
    click element    ${Advanced_filter_Discount}
    Wait until page contains element   ${Filter_Advanced}
    Element should be enabled          ${Filter_Advanced}

Filter GiftCard by Customer email-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${customerEmailFilterAd}
    Input Text       ${customerEmailFilterAd}        ${GiftCard_email}
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain                    ${GiftCard_email}
    Click Element    ${customerEmailFilterAd}
    Press Keys       ${customerEmailFilterAd}         CTRL+A+DELETE

Filter GiftCard by Total Amount-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element   ${TotalAmount_FilterAd}
    Input Text       ${TotalAmount_FilterAd}       150.00
    Click Element    ${Filter_button}
    Sleep             2
    Page Should Contain    150.00
    Click Element    ${TotalAmount_FilterAd}
    Press Keys       ${TotalAmount_FilterAd}         CTRL+A+DELETE

Filter GiftCard by Redeem Amount-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${RedeemAmount_FilterAd}
    Input Text       ${RedeemAmount_FilterAd}       0
    Click Element    ${Filter_button}
    Sleep            2
    Page Should Contain      0
    Click Element    ${RedeemAmount_FilterAd}
    Press Keys       ${RedeemAmount_FilterAd}            CTRL+A+DELETE

Filter GiftCard by Valid from-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${Validfrom_FilterAd}
    Input Text       ${Validfrom_FilterAd}    ${Active_from}
    Click Element    ${Filter_button}
    Sleep            2

    Click Element    ${Validfrom_FilterAd}
    Press Keys       ${Validfrom_FilterAd}       CTRL+A+DELETE


Filter GiftCard by Valid to-Advanced
    wait until page contains element    ${Filter_Advanced}
    click element    ${ValitTo_FilterAd}
    Input Text       ${ValitTo_FilterAd}        ${Active_to}
    Click Element    ${Filter_button}
    Sleep            2

    Click Element    ${ValitTo_FilterAd}
    Press Keys       ${ValitTo_FilterAd}       CTRL+A+DELETE
Filter GiftCard by Status - Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${SelectStatus_Filter}
    Press Keys       ${SelectStatus_Filter}    Active    RETURN
    Click Element    ${Filter_button}
    Sleep            2

Single filter & Confirm
    [Arguments]    ${arg1}
    Wait until page contains element     ${singleFilter_field}
    Click Element                        ${singleFilter_field}
    Press Keys                           ${singleFilter_field}            ${customerEmail}       RETURN
    Input Text                           ${singleFilterInputField}                  ${arg1}
    Click button                         ${filterBtn}
    sleep    2
    ${randomRecord}    Choose Random Record in the table
    ${randomRowFirstTD}    CATENATE    SEPARATOR=    ${tableRow}  [  ${randomRecord}  ]    ${firstTD}
    Element Should Contain               ${randomRowFirstTD}        ${arg1}      ${None}     ${True}


Filter by Advanced filter
    [Arguments]     ${arg1}
    Wait until page contains element     ${singleFilter_field}
    Click element                        ${advanced_Filter_Element}
    Input text                           ${customerEmailFilterAd}                   ${arg1}
    Click button                         ${filterBtn}


Advanced filter & Confirm element is there
    [Arguments]     ${arg1}
    Filter by Advanced filter            ${arg1}
    sleep    2
    ${randomRecord}    Choose Random Record in the table
#   form xpath for a random row in the table where the we will get the value from its first TD html element
    ${randomRowFirstTD}    CATENATE    SEPARATOR=    ${tableRow}  [  ${randomRecord}  ]    ${firstTD}
    Wait until element is not visible    ${tableSpinner}
    Wait Until Element Contains          ${table}                   ${arg1}
#   Element Should Contain has 4 args, of which: ${None} e bukvalno None, a ${True} e true. P.S. ctrl + click na varijablite za da gi vidis kako i kade se definirani
    Element Should Contain              ${randomRowFirstTD}        ${arg1}      ${None}     ${True}


Advanced filter & Confirm element is not there
    [Arguments]     ${arg1}
    Filter by Advanced filter
    Wait until element is not visible            ${tableSpinner}
    Wait Until Element Does Not Contain          ${table}       ${arg1}

Reset Advanced filter
    [Arguments]     ${arg1}
    Click Button                                     ${resetBtn}
    Wait until element is not visible                ${tableSpinner}
    Element Should Not Contain                       ${singleFilterInputField}       ${arg1}

Edit Gift Card
    Wait until element is not visible    ${tableSpinner}

    Click Element      ${editBtn}
#    Wait until page contains element     ${validFrom}
    sleep                                2
    Click Element                        ${customerEmailField}
    Press Keys                           ${customerEmailField}        CTRL+A+DELETE
    Input Text                           ${customerEmailField}        ${mockTestCustomerEmail2}
    Click Element                        ${totalAmount}
    Press Keys                           ${totalAmount}         CTRL+A+DELETE
    Input Text                           ${totalAmount}              ${GiftCard_TotalAmount}
    Click Element                        ${validFrom}
    Press Keys                           ${validFrom}                 CTRL+A+DELETE
    Click Element                        ${validTo}
    Press Keys                           ${validTo}                   CTRL+A+DELETE
    Input text                           ${validFrom}                               ${Active_from}
    Input text                           ${validTo}                                 ${Active_to}
    Click Element                        ${SelectStatus_Filter}
    Press Keys                           ${SelectStatus_Filter}        Inactive      RETURN
    Click button                         ${updateBtn}
    sleep                                2
    Page Should Contain                  ${UpdateGiftCard_Msg}
    Wait until location is               ${giftCardsUrlPath}
    Wait until page contains element     ${createGiftCBtn}




Delete Gift Card
    [Arguments]    ${arg1}
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Customer email    RETURN
    Input Text       ${CustomerEmail_Filter}       ${arg1}
    Click Element    ${Filter_button}
    Sleep            2
    Click Element                                ${deleteRowBtn}
    Wait until element is not visible            ${tableSpinner}
    Wait until page contains element             ${confirmationModal}
    Element should contain                       ${confirmBtn}                      CONFIRM
    Element should contain                       ${cancellBtn}                       CANCEL
    Click Element                                ${cancellBtn}
    Click Element                                ${deleteRowBtn}
    sleep                                        2
    Click Element                                ${confirmBtn}
    sleep                                        2
    Page Should Contain                          ${DeleteGiftCard_Msg}
    wait until page contains element    ${SelectFiter}
    Click element    ${SelectFiter}
    Press Keys       ${SelectFiter}    Customer email    RETURN
    Input Text       ${CustomerEmail_Filter}       ${mockTestCustomerEmail2}
    Click Element    ${Filter_button}
    Sleep            2
    Element Should Contain              ${table}                           ${tableIsEmpty}


Choose cancel when exporting the Gift Card - Selected Gift Card

    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element     ${MoreOptionsBtn}
    Click Element     ${MoreOpt_ExportSelected}
    sleep             2
    Click Element     ${cancellBtn}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
    Click Element    ${Select_checkbox}

Choose cancel when exporting the Gift Card - All Gift Cards

    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element     ${MoreOptionsBtn}
    Click Element     ${MoreOpt_ExportAll}
    sleep             2
    Click Element     ${cancellBtn}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
    Click Element    ${Select_checkbox}
Choose confirm when exporting the Gift Card - Selected Gift Card

    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element     ${MoreOptionsBtn}
    Click Element     ${MoreOpt_ExportSelected}
    sleep             2
    Click Element     ${confirmBtn}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
#    Click Element    ${Select_checkbox}
    sleep            2

Choose confirm when exporting the Gift Card - All Gift Cards

    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element     ${MoreOptionsBtn}
    Click Element     ${MoreOpt_ExportAll}
    sleep             2
    Click Element     ${confirmBtn}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
#    Click Element    ${Select_checkbox}