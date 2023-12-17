*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/UsersPage.robot
Resource          ../Keywords/UsersCRUD.robot



*** Test Cases ***
#User tries to create a new user by adding all the mandatory field values, by using a unique user email
TC_CreUser_1 Create user with unique User email
    Navigate to the Create User page
    Add values to mandatory User fields
    Create and verify new user
#
#User tries to create a new user by adding all the mandatory field values, by using a duplicate user email
TC_CreUser_2 Create user with duplicate User email(same tenant)
    Navigate to the Create User page
    Add values to mandatory User fields
    Create and verify new user can not be created with duplicate email
#
#User tries to create a new user by missing mandatory field values
TC_CreUser_3 Create user with missing mandatory fields
    Navigate to the Create User page
    Add values to mandatory User fields
    Remove value from mandatory field
    Create and verify new user can not be created with missing mandatory field
#
#User tries to edit an existing user by removing mandatory field values
TC_EditUser_1 Edit user by removing mandatory data
    Navigate to Users page
    Verify Users page
    Single filter new User
    Navigate to teh Edit User page
    Remove value from mandatory field
    Update and verify user can not be updated with missing mandatory field

#User tries to edit an existing user by adding field values
TC_EditUser_2 Edit user by adding data
    Navigate to Users page
    Verify Users page
    Single filter new User
    Navigate to teh Edit User page
    Add additional values from Edit User page
    Update and verify user can be updated by adding data

#User tries to edit an existing user by adding a Super Admin role
TC_EditUser_3 Edit user by a adding a Super Admin role
    Navigate to Users page
    Verify Users page
    Single filter new User
    Navigate to teh Edit User page
    Verify Super admin role can not be added to user

#User tries to delete existin user by using the delete button in Users Page
TC_DeleteUser_1 Delete user from Users page
    Navigate to Users page
    Verify Users page
    Single filter new user
    Delete user from Users Page






