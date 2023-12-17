*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CustomersPage.robot
Resource          ../PageObjects/CreateCustomer.robot
Resource          ../PageObjects/EditCustomer.robot
Resource          ../PageObjects/DeleteCustomer.robot
Resource          ../Resources/Testdata.robot
Resource           CustomersPage.robot

*** Keywords ***
Cancel a customer deletion
    Click button    ${canceldeletecustom_btn}
    wait until location is    ${Customersurlpath}
    page should contain element    ${Customerstitle_text}
Verify customer is not deleted
    location should be    ${Customersurlpath}
    Filter customer by single filters
    page should contain    ${ActiveCategory_slug}
