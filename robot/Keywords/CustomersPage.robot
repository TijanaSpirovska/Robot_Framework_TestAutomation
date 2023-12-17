*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CustomersPage.robot
Resource          ../Resources/Testdata.robot
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CustomersPage.robot
Resource          ../PageObjects/CreateCustomer.robot
Resource          ../Resources/Testdata.robot
*** Keywords ***
Navigate to Customers page
    Click link           ${Customers_link}
    Location should be   ${CustomersUrlPath}
Verify Customers page
    Page should contain element                          ${CustomersTitle_text}

Verify Single filter is enabled
    Wait until page contains element    ${SingleFilter_field_CustPage}
    Element should be enabled           ${SingleFilter_field_CustPage}
Filter customer by Single-First Name filters
    wait until page contains element   ${SingleFilter_field_CustPage}
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_FirstName}        ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
Filter customer by Single-Last Name filters
    wait until page contains element   ${SingleFilter_field_CustPage}
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    Last Name    RETURN
    Input Text          ${SingleFilter_LastName}       ${Cust_LastName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
Filter customer by Single-Username filters
    wait until page contains element   ${SingleFilter_field_CustPage}
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    Username    RETURN
    Input Text          ${SingleFilter_Username}        ${Cust_Username}
    Click Element       ${Filter_button_CustPage}
    sleep       2
Filter customer by Single-Customer Email filters
    wait until page contains element   ${SingleFilter_field_CustPage}
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    Customer email    RETURN
    Input Text          ${SingleFilter_Email}        ${Cust_Email}
    Click Element       ${Filter_button_CustPage}
    sleep       2
Filter customer by Single-Phone filters
    wait until page contains element   ${SingleFilter_field_CustPage}
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    Phone    RETURN
    Input Text          ${SingleFilter_Phone}      ${Cust_Phone}
    Click Element       ${Filter_button_CustPage}
    sleep       2
Verify Advanced filter is enabled
    click element    ${Advanced_filter_ProdPage}
    Wait until page contains element   ${Filter_Advanced}
    Element should be enabled          ${Filter_Advanced}
Filter customer by Advanced-First Name filters
    wait until page contains element   ${Filter_Advanced}
    Input Text          ${AdvancedFilter_Firstname}        ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Page Should Contain    ${Cust_FirstName}
    click element                       ${AdvancedFilter_Firstname}
    Press Keys                           ${AdvancedFilter_Firstname}     CTRL+A+DELETE
    sleep       2
Filter customer by Advanced-Last Name filters
    wait until page contains element   ${Filter_Advanced}
    Input Text          ${AdvancedFilter_Lastame}       ${Cust_LastName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
#    Page Should Contain  ${Cust_LastName}
    Click Element        ${AdvancedFilter_Lastame}
    Press Keys           ${AdvancedFilter_Lastame}          CTRL+A+DELETE
Filter customer by Advanced-Username filters
    wait until page contains element   ${Filter_Advanced}
    Input Text          ${AdvancedFilter_Username}       ${Cust_Username}
    Click Element       ${Filter_button_CustPage}
    sleep       2
#    Page Should Contain  ${Cust_Username}
    Click Element        ${AdvancedFilter_Username}
    Press Keys           ${AdvancedFilter_Username}         CTRL+A+DELETE
Filter customer by Advanced-Customer Email filters
    wait until page contains element   ${Filter_Advanced}
    Input Text          ${AdvancedFilter_CustomerEmail}       ${Cust_Email}
    Click Element       ${Filter_button_CustPage}
    sleep       2
#    Page Should Contain  ${Cust_Email}
    Click Element        ${AdvancedFilter_CustomerEmail}
    Press Keys           ${AdvancedFilter_CustomerEmail}          CTRL+A+DELETE
Filter customer by Advanced-Phone filters
    wait until page contains element   ${Filter_Advanced}
    Input Text          ${AdvancedFilter_Phone}        ${Cust_Phone}
    Click Element       ${Filter_button_CustPage}
    sleep       2
#    Page Should Contain  ${Cust_Phone}
    Click Element        ${AdvancedFilter_Phone}
    Press Keys           ${AdvancedFilter_Phone}           CTRL+A+DELETE
Choose confirm when modifying the customer - Archive selected
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_ArchiveSelected}
    Click Element      ${Confirm_button}
    wait until page contains  ${SuccessfulUpdate_customer}
    sleep              2
Choose cancel when modifying the product - Archive selcted
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_ArchiveSelected}
    Click Element      ${Cancel_button}
    Page Should Not Contain      ${SuccessfulUpdate_customer}
    sleep              2
Choose cancel when modifying the customer - Archive All found
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_ArchiveAll}
    Click Element      ${Cancel_button}
    Page Should Not Contain      ${SuccessfulUpdate_customer}
    sleep              2
Choose confirm when modifying the customer - Archive All found
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_ArchiveAll}
    Click Element      ${Confirm_button}
    wait until page contains      ${SuccessfulUpdate_customer}
    sleep              2
Filter Archived Customers
    Click Element    ${ArchivedCustomers_btn}
Choose confirm when modifying the customer - Unarchive selected
    Click Element      ${ArchivedCustomers_btn}
    sleep              2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_UnarchiveSelected}
    Click Element      ${Confirm_button}
    wait until page contains  ${SuccessfulUpdate_customer}
    sleep              2
    Click Element       ${ArchivedCustomers_btn}
Choose cancel when modifying the customer - Unarchive selected
    Click Element      ${ArchivedCustomers_btn}
    sleep              2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_UnarchiveSelected}
    Click Element      ${Cancel_button}
    Page Should Not Contain  ${SuccessfulUpdate_customer}
    sleep              2
    Click Element       ${ArchivedCustomers_btn}
Choose confirm when modifying the customer - Unarchive all
    Click Element       ${ArchivedCustomers_btn}
    sleep              2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_UnarchiveAll}
    Click Element      ${Confirm_button}
    wait until page contains  ${SuccessfulUpdate_customer}
    sleep              2
    Click Element       ${ArchivedCustomers_btn}
Choose cancel when modifying the customer - Unarchive all
    Click Element       ${ArchivedCustomers_btn}
    sleep              2
    Click Element      ${Select_checkbox}
    Click Element      ${MoreOptionsBtn_ProdPage}
    Click Element      ${MoreOpt_UnarchiveAll}
    sleep               2
    Click Element      ${Cancel_button}
    Page Should Not Contain  ${SuccessfulUpdate_customer}
    sleep              2
    Click Element       ${ArchivedCustomers_btn}
Choose confirm when exporting the customer - All customers
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ExportAll}
    sleep             2
    Click Element     ${Confirm_button}
    wait until page contains  ${SuccesfulDownload}
    sleep              2
Choose cancel when exporting the customer - All customers
    Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ExportAll}
    sleep             2
    Click Element     ${Cancel_button}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
Choose cancel when exporting the customer - Selected customer
     Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ExportSelected}
    sleep             2
    Click Element     ${Cancel_button}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
    Click Element    ${Select_checkbox}
Choose confirm when exporting the customer - Selected customer
     Click Element       ${SingleFilter_field_CustPage}
    Press Keys          ${SingleFilter_field_CustPage}    First Name    RETURN
    Input Text          ${SingleFilter_by_CustPage}       ${Cust_FirstName}
    Click Element       ${Filter_button_CustPage}
    sleep       2
    Click Element    ${Select_checkbox}
    sleep             2
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ExportSelected}
    sleep             2
    Click Element     ${Confirm_button}
    Wait Until Page Contains                  ${SuccesfulDownload}
    sleep              2
    Click Element    ${Select_checkbox}