*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
#Resource          ../Keywords/EditCategory.robot
Resource          ../Keywords/CategoriesPage.robot
Resource          ../Keywords/DeleteCategory.robot
Resource          ../Keywords/CreateCategory.robot

*** Test Cases ***

TC_DelCateg_1 Delete inactive category
#User deletes category that does not contain a product (Vale)
    Navigate to Categories page
    Verify Categories page
    Delete a category that does not contain a product
    Verify Inactive category is not deleted

TC_DelCateg_2 Cancel category deletion
#User tries to delete a category, but cancels the deletion afterwards (Vale)
    Navigate to Categories page
    Verify Categories page
    Filter Active Category by Single filters
    Delete category
    Cancel a category deletion
    Verify Active category is not deleted