*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/CustomerDataCRUD.robot

*** Test Cases ***
#User tries to create Customer data by missing mandatory field values during creation
TC_CustData_1 Create a Customer Attribute with missing mandatory fields
    Navigate to Customer Data page
    Verify Customer Data page
    Add new Customer Attribute
    Create a Custom Attribute
    Verify Customer Attribute is not created
##User tries to create Customer data by adding all mandatory field values during creation
TC_CustData_2 Create a Customer Attribute with all mandatory fields
    Navigate to Customer Data page
    Verify Customer Data page
    Add new Customer Attribute
    Fill in Customer data                               ${Cust_Attribute}
    Create a Custom Attribute
    Verify Customer Attribute is created                ${Cust_Attribute}
##User verifies Customer data Single filters
TC_CustData_3 Verify Customers Data Page and Single filters
    Navigate to Customer Data page
    Verify Customer Data page
    Verify Single filter is enabled for Customer Data
    Filter Customer Attribute By Single Filters -Name             ${Cust_Attribute}
    Filter Customer Attribute by Single filters - Type
#User verifies Customer data Advanced filters
TC_CustData_4 Verify Customers Data Advanced fitlers
    Navigate to Customer Data page
    Verify Customer Data page
    Verify Advanced filter is enabled for Customer Data
    Filter Customer Attribute by Advanced filters - Name      ${Cust_Attribute}
    Filter Customer Attribute by Advanced filters - Type
    Filter Customer Attribute by Advanced filters - Required
#User tries to edit Customer data by missing mandatory field values during editing
TC_CustData_5 Edit Customers attribute with missing mandatory data
     Navigate to Customer Data page
     Verify Customer Data page
     Edit Customer Attribute by removing mandatory data
     Verify Customer Attribute is not updated
#User tries to edit Customer attribute by adding all mandatory field values during editing
TC_CustData_6 Edit a Customers attribute by adding new data
     Navigate to Customer Data page
     Verify Customer Data page
     Edit Customer Attribute by adding valid data
     Verify Customer Attribute is successfully updated
     Filter Customer Attribute by Single filters -Name   ${Updated}
     Filter Customer Attribute by Single filters - Type
#User tries to delete Customer Customer attribute by using the Cancel delete button
TC_CustData_7 Delete Customers attribute by using Cancel button
     Navigate to Customer Data page
     Verify Customer Data page
     Filter Customer Attribute by Single filters -Name   ${Updated}
     Choose Cancel when deleting a Customer attribute
     Verify Customer attribute is not deleted
#User tries to delete Customer attribute by using the Confirm delete button
TC_CustData_8 Delete Customers attribute by using Confirm button
     Navigate to Customer Data page
     Verify Customer Data page
     Filter Customer Attribute by Single filters -Name   ${Updated}
     Choose Confirm when deleting a Customer attribute
     Verify Customer attribute is deleted





