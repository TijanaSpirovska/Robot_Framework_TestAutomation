*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/RolesPermissionsPage.robot
Resource          ../Keywords/UsersPage.robot

*** Test Cases ***

TC_RolesPermCRUD_1 CRUD scenario for Roles And Permissions
    Navigate and Verify Roles ans Permissions page
    Add new User role
    Verify new User role is created
    Start editing a User role
    Save the edited User role
    Verify User role is edited
    Delete an unassigned User role
    Verify an unasigned role is deleted