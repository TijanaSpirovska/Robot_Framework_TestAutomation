*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/RolesPermissionsPage.robot
Resource          ../Keywords/UsersPage.robot

*** Test Cases ***
#User creates a new user role (Vale)
#TC000x_1 Create a new User role
#    Navigate and Verify Roles ans Permissions page
#    Add new User role
#    Verify new User role is created

#User edits an already created User role by deleting mandatory data (Vale)
#TC000x_2 Edit User role with missing mandatory data
#    Navigate and Verify Roles ans Permissions page
#    Update User role by removing mandatory data
#    Verify User role can't be edited with missing mantory data
#
##User edits an already created User role mandatory data populated (Vale)
#TC000x_3 Edit User role with mandatory data populated
#    Navigate and Verify Roles ans Permissions page
#    Start editing a User role
#    Save the edited User role
#    Verify User role is edited
#
##User tries to delete a User role that was not prevously asigned to any user (Vale)
#TC000x_4 Delete an asigned User role
#    Navigate and Verify Roles ans Permissions page
#    Verify disabled Delete option for asigned User role
#    Verify asigned User role can not be deleted
#
##User tries to delete a User role that was prevously asigned to existing user (Vale)
TC000x_5 Delete an unasigned User role
    Navigate and Verify Roles ans Permissions page
    Delete an unassigned User role
    Verify an unasigned role is deleted
