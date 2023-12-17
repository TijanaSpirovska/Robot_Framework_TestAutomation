*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CustomersPage.robot
Resource          ../PageObjects/CreateCustomer.robot
Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/EditCustomerPage.robot
Resource           CustomersPage.robot



*** Keywords ***
Navigate to Edit Customer page
    click element                     ${EditCustom_button}
    Wait until page contains element  ${EditCustomerTitle_text}
Verify the Edit Customer page contains all the default elements
    Wait until page contains element  ${InputFirstName_EditCustom}
    Page should contain element       ${InputLastName_EditCustom}
    Page should contain element       ${InputPhone_EditCustom}
    Page should contain element       ${InputEmail_EditCustomPage}
    Page should contain element       ${SelectAddressBilling_EditCustom}
    Page should contain element       ${SelectAddressShipping_EditCustom}
#    Page should contain element       ${BillingAddressDefault_Checkbox_EditCustom}
#    Page should contain element       ${ShippingAddressDefault_Checkbox}
    Page should contain element       ${InputAddressName_Billing_EditCustom}
    Page should contain element       ${InputAddressName_Shipping_EditCustom}
    Page should contain element       ${InputZipCode_Billing_EditCustom}
    Page should contain element       ${InputZipCode_Shipping_EditCustom}
    Page should contain element       ${InputCity_Billing_EditCustom}
    Page should contain element       ${InputCity_Shipping_EditCustom}
    Page should contain element       ${SelectCountry_Billing_EditCustom}
    Page should contain element       ${SelectCountry_Shipping_EditCustom}
    Page should contain element       ${SelectState_Billing_EditCustom}
    Page should contain element       ${SelectState_Shipping_EditCustom}

Delete data from mandatory fields in Edit Customer page
    Click Element                    ${InputAddressName_Billing_EditCustom}
    Press Keys                       ${InputAddressName_Billing_EditCustom}     CTRL+A+DELETE
    Click Element                    ${InputAddressName_Shipping_EditCustom}
    Press Keys                       ${InputAddressName_Shipping_EditCustom}    CTRL+A+DELETE
    Click Element                    ${InputCity_Billing_EditCustom}
    Press Keys                       ${InputCity_Billing_EditCustom}            CTRL+A+DELETE
    Click Element                    ${InputCity_Shipping_EditCustom}
    Press Keys                       ${InputCity_Shipping_EditCustom}              CTRL+A+DELETE
    Click Element                    ${InputLastName_EditCustom}
    Press Keys                       ${InputLastName_EditCustom}               CTRL+A+DELETE
    Click Element                    ${InputFirstName_EditCustom}
    Press Keys                       ${InputFirstName_EditCustom}               CTRL+A+DELETE
    Click Element                    ${BillingAdressNumber}
    Press Keys                       ${BillingAdressNumber}                     CTRL+A+DELETE
    Click Element                    ${ShippingAdressNumber}
    Press Keys                       ${ShippingAdressNumber}                    CTRL+A+DELETE
    Click Element                    ${InputZipCode_Billing_EditCustom}
    Press Keys                       ${InputZipCode_Billing_EditCustom}                   CTRL+A+DELETE
     Click Element                   ${InputZipCode_Shipping_EditCustom}
    Press Keys                       ${InputZipCode_Shipping_EditCustom}                    CTRL+A+DELETE
    sleep    2
Update edited Customer
    Click button                      ${UpdateBtn_EditCustomPage}
Verify Customer can be updated after adding data in existing fields
    Wait until page contains element  ${CustomersTitle_text}
    Filter customer by Single-First Name filters
    Navigate to Edit Customer page
    Wait until page contains element  ${InputFirstName_EditCustom}
    textfield should contain          ${InputFirstName_EditCustom}  ${Cust_FirstName}
Verify Customer can not be edited with empty mandatory fields
    Page should contain element       ${BillAddressRequired_error_msg}
    Page should contain element       ${AddressRequired_error_msg}
    Page should contain element       ${BillAddressCityRequired_error_msg}
    Page should contain element       ${ShipAddressCityRequired_error_msg}
    Page Should Contain Element       ${FirstName_ErrorMsg}
    Page Should Contain Element       ${LastName_ErrorMsg}
    Page Should Contain Element       ${AddressNumRequired_error_msg}
    Page Should Contain Element       ${AddressZipRequired_error_msg}
    Location should contain           ${CustomersUrlPath}
Add data to existing Customer Name data field
    Click element                     ${InputFirstName_EditCustom}
    Press keys                        ${InputFirstName_EditCustom}     ${Cust_FirstName}      RETURN
Verify Customer can not be updated after adding a duplicate email
    Update edited Customer
    location should contain            ${CustomersUrlPath}
    #wait until page contains element   ${InvalidDataAlert_EditCustomPage}
Test Customer data clean up
    Clear element text                 ${InputFirstName_EditCustom}
    Click element                      ${InputFirstName_EditCustom}
    Press keys                         ${InputFirstName_EditCustom}     ${TestCustomerName}      RETURN
    Sleep     5
#    click button                       ${UpdateBtn_EditCategPage}



