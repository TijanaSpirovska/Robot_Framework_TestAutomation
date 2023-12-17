*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/UsersPage.robot
Resource          ../Keywords/UsersCRUD.robot


*** Test Cases ***

TC_UsersCRUD_1 CRUD scenario for Users
    Navigate to the Create User page
    Add values to mandatory User fields
    Create and verify new user
    Navigate to teh Edit User page
    Add additional values from Edit User page
    Update and verify user can be updated by adding data
    single filter new user
    Delete user from Users Page


