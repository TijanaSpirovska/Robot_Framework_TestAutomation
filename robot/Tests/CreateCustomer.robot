*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Login.robot
Resource          ../Keywords/CreateCustomer.robot
Resource          ../Keywords/CustomersPage.robot
Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/LoginPage.robot
Resource          ../PageObjects/HomePage.robot

*** Test Cases ***
#
#TC_CreCustom_1 Create new customer with Billing details missing
#
#    Navigate to Customers page
#    Add a customer
#    Add values to the General required customer fields
#    Add values to the Shipping required customer fields
#    Complete the customer creation with missing mandatory fields
#    Verify Customer can not be created with missing Billing details
#
#TC_CreCustom_2 Create new customer with Shipping details missing
#
#    Navigate to Customers page
#    Add a customer
#    Add values to the General required customer fields
#    Add values to the Billing required customer fields
#    Complete the customer creation with missing mandatory fields
#    Verify Customer can not be created with missing Shipping details
#
#TC_CreCustom_3 Create new customer with invalid Username format
#
#
#    Navigate to Customers page
#    Add a customer
#    Add values to the General required customer fields
#    Add values to the Billing required customer fields
#    Add values to the Shipping required customer fields
#    Add wrong Username value format
#    Complete the customer creation with missing mandatory fields
#    Verify Customer can not be created with Username wrong value format

TC_CreCustom_4 Create new customer with mandatory fields filled in
# User creates Customer with filling in only mandatory fields, verifies the newly creted Customer and deletes it (Vale)
    Navigate to Customers page
    Add a customer
    Add values to the General required customer fields
    Add values to the Billing required customer fields
    Add values to the Shipping required customer fields
    Complete the customer creation
    Verify customer is successfully created
#
#TC_CreCustom_5 Create new customer with a duplicate email address(same tenant)
## User creates Customer with an email address that is alredy taken/used for another user in the same tenant
#
#    Navigate to Customers page
#    Add a customer
#    Add values to the General required customer fields
#    Add values to the Billing required customer fields
#    Add values to the Shipping required customer fields
#    Complete the customer creation
#    Verify Customer can not be created with duplicate email address
#TC_DeleteCustomer_6 Delete Customers by using Cancel button
#    Navigate to Customers page
#    Filter customer by Single-Customer Email filters
#    Choose Cancel when deleting a Customer
#    Verify customer is not deleted
#TC_DeleteCustomer_7 Delete Customers by using Confirm button
#    Navigate to Customers page
#    Filter customer by Single-Customer Email filters
#    Choose Confirm when deleting a Customer
#    Verify customer is deleted