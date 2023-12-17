*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/EditCategory.robot
Resource          ../Keywords/CategoriesPage.robot


*** Test Cases ***
TC_EditCat_1 Edit an existing category by removing mandatory data
#User verifies thatt category can not be edited by removing the mandatory fields data  (Vale)
    Navigate to Categories page
    Verify Categories page
    Filter Active Category by Single filters
    Navigate to Edit Category page
    Verify the Edit Category page contains all the default elements
    Delete data from mandatory field in Edit Category page
    Update edited Category
    Verify Category can not be edited with empty mandatory fields

TC_EditCat_2 Edit category by adding data
# User verifies that category can be updated by adding additional data to the existing Category fields (Vale)
# Test data clean up can also be done via DB(to do) (Vale)
    Navigate to Categories page
    Verify Categories page
    Filter Active Category by Single filters
    Navigate to Edit Category page
    Verify the Edit Category page contains all the default elements
    Add data to existing Category Name data field
    Verify Category can be updated after adding data in existing fields
    Test Category data clean up

TC_EditCat_3 Edit category by adding a duplicate slug
# User verifies that category can not be edited by adding a duplicate SLUG data (exist for another category) (Vale)
    Navigate to Categories page
    Verify Categories page
    Filter Active Category by Single filters
    Navigate to Edit Category page
    Verify the Edit Category page contains all the default elements
    Add data to existing Slug field
    Verify Category can not be updated after adding a duplicate slug

