*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CustomersPage.robot
Resource          ../PageObjects/CreateCustomer.robot
Resource          ../Resources/Testdata.robot
Resource          ../Keywords/CustomersPage.robot
*** Keywords ***
# User creates customer with filling in only mandatory fields, verifies the newly created customer and deletes it (Vale)
# Data cleanup can also be done via DB(to do) (Vale)

Add a Customer
    Click button                        ${AddCustomerBtn_CustPage}
    Wait until page contains element    ${CreateCustomerTitle_text}
    Location should be                  ${createcustomersUrlPath}
Add values to the General required customer fields
    Input text      ${InputFirstName_CreateCustomPage}      ${Cust_FirstName}
    Input text      ${InputLastName_CreateCustomPage}       ${Cust_LastName}
    Input text      ${InputPhone_CreateCustomPage}          ${Cust_Phone}
    Input text      ${InputUsername_CreateCustomPage}       ${Cust_Email}
Add wrong Username value format
    page should contain element                             ${InputUsername_CreateCustomPage}
    clear element text                                      ${InputUsername_CreateCustomPage}
    input text      ${InputUsername_CreateCustomPage}       ${Customer_WrongEmail}
Add values to the Billing required customer fields
    Wait until page contains element    ${SelectAddressType_BillingField}
#    Wait until page contains element    ${BillingAddressDefault_Checkbox}
    Input text      ${InputAddressName_Billing_field}       ${mock_test_address}
    Input text      ${InputAddressNumber_Billing_field}     ${mock_test_addressNumber}
    Input text      ${InputZipCode_Billing_field}           ${mock_test_zipCode}
    Input text      ${InputCity_Billing_field}              ${mock_test_city}
    sleep       1
    Click element   ${selectCountry_billing_field}
    Press keys      ${selectCountry_billing_field}          ${mock_test_country}    RETURN
    sleep       1
    Click element   ${selectState_billing_field}
    Press keys      ${selectSTate_billing_field}            ${mock_test_state}      RETURN
    sleep       1
Add values to the Shipping required customer fields
    Wait until page contains element    ${SelectAddressType_ShippingField}
#    Wait until page contains element    ${ShippingAddressDefault_Checkbox}
    Input text      ${InputAddressName_Shipping_field}      ${mock_test_address}
    Input text      ${InputAddressNumber_Shipping_field}    ${mock_test_addressNumber}
    Input text      ${InputZipCode_Shipping_field}          ${mock_test_zipCode}
    Input text      ${InputCity_Shipping_field}             ${mock_test_city}
    Click element   ${selectCountry_Shipping_field}
    Press keys      ${selectCountry_Shipping_field}         ${mock_test_country}     RETURN
    Click element   ${selectState_Shipping_field}
    Press keys      ${selectSTate_Shipping_field}           ${mock_test_state}       RETURN
Complete the customer creation
    Click button    ${CreateBtn_CreateCustomPage}
    sleep    5
Complete the customer creation with missing mandatory fields
    Click button    ${CreateBtn_CreateCustomPage}
Verify customer is successfully created
   wait until location is                                   ${CustomersUrlPath}
   scroll element into view                                 ${Advanced_filter_CustPage}
   wait until page contains element                         ${Advanced_filter_CustPage}
   Click element    ${Advanced_filter_CustPage}
   Input text       ${InputEmail_CustPage}                  ${Cust_Email}
   Click button     ${Filter_button_CustPage}
   Wait until page contains                                 ${Cust_Email}
Verify Customer can not be created with missing Billing details
   Page should contain element                              ${AddressRequired_error_msg}
   Page should contain element                              ${AddressNumRequired_error_msg}
   Page should contain element                              ${AddressZipRequired_error_msg}
   Page should contain element                              ${AddressCityRequired_error_msg}
   Page should contain element                              ${AddressCountryRequired_error_msg}
   location should be                                       ${CreatecustomersUrlPath}
Verify Customer can not be created with missing Shipping details
   Page should contain element                              ${AddressRequired_error_msg}
   Page should contain element                              ${AddressNumRequired_error_msg}
   Page should contain element                              ${AddressZipRequired_error_msg}
   Page should contain element                              ${AddressCityRequired_error_msg}
   Page should contain element                              ${AddressCountryRequired_error_msg}
   location should be                                       ${CreateCustomersUrlPath}
Verify Customer can not be created with duplicate email address
    wait until page contains element                        ${CustomerEmail_warning}
    location should be                                      ${CreatecustomersUrlPath}
Verify Customer can not be created with Username wrong value format
    location should be                                      ${CreatecustomersUrlPath}
    wait until page contains element                        ${Customer_WrongEmail}
Delete customer
   Click element    ${DeleteCustom_button}
   wait until page contains element                         ${ConfirmDeleteCustom_btn}
   Click button     ${ConfirmDeleteCustom_btn}
Verify customer data is sccessfully cleaned
   Input text       ${InputEmail_CustPage}                  ${mock_test_email}
   Click button     ${Filter_button_CustPage}
   Wait until page does not contain                         ${mock_test_email}
Verify customer is deleted
    Location Should Be        ${CustomersUrlPath}
    page should contain element             ${CustTable}
    Filter customer by Single-Customer Email filters
    wait until page does not contain        ${Cust_Email}
Verify customer is not deleted
    Location Should Be        ${CustomersUrlPath}
    page should contain element             ${CustTable}
    Filter customer by Single-Customer Email filters
    Wait Until Page Contains            ${Cust_Email}
Choose Confirm when deleting a Customer
    click element    ${DeleteCustomer}
    sleep      2
    wait until page contains element        ${Delete_Dialogue}
    wait until page contains element        ${CancelDelete_Btn}
    page should contain element             ${ConfirmDelete_Btn}
    click button                            ${ConfirmDelete_Btn}
    sleep        2
    Page Should Contain                     ${DeleteCustomer_Msg}
Choose Cancel when deleting a Customer
    Page Should Contain Element    ${DeleteCustomer}
    click element    ${DeleteCustomer}
    Sleep      2
    Page Should Contain Element               ${Delete_Dialogue}
    wait until page contains element        ${CancelDelete_Btn}
    page should contain element             ${ConfirmDelete_Btn}
    click button                            ${CancelDelete_Btn}
