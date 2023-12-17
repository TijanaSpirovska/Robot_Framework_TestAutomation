*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/EditCustomer.robot
Resource          ../Keywords/CustomersPage.robot


*** Test Cases ***
TC_EditCust_1_Edit customer by removing mandatory data
#User verifies that customer can not be edited by removing the mandatory fields data
    Navigate to Customers page
    Filter customer by Single-First Name filters
    Navigate to Edit Customer page
    Verify the Edit Customer page contains all the default elements
    Delete data from mandatory fields in Edit Customer page
    Update edited Customer
    Verify Customer can not be edited with empty mandatory fields

TC_EditCust_2_Edit customer by adding data
# User verifies that customer can be updated by adding additional data to the existing Customer fields

    Navigate to Customers page
    Filter customer by Single-First Name filters
    Navigate to Edit Customer page
    Verify the Edit Customer page contains all the default elements
    Add data to existing Customer Name data field
    Verify Customer can be updated after adding data in existing fields
    Test Customer data clean up
