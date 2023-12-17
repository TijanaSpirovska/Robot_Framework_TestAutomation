*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/CreateCategory.robot
Resource          ../Keywords/CategoriesPage.robot


*** Test Cases ***
TC_CreCateg_1 Create new category with only mandatory fields
# User creates category with filling in only mandatory fields, verifies the newly creted category and deletes it (Vale)
# Data cleanup can also be done via DB(to do) (Vale)
    Navigate to categories page
    Add a category
    Add values to the mandatory Category fields
    Complete the category creation
    Verify Category is successfully created
    Delete new category(clenup data)
    Verify Category data is sccessfully cleaned

TC_CreCateg_2 Create new category with mandatory fields missing
# User creates category with filling in only non-mandatory fields, verifies a new category is not created/error input fields (Vale)
     Navigate to categories page
     Add a category
     Add values to non-mandatory fields
     Complete the category creation with missing mandatory fields
     Verify Category can not be created with missing mandatory values

TC_CreCateg_3 Create new category with all available fields
## User creates category with filling in mandatory + non-mandatory fields, verifies the newly creted category and deletes it (Vale)
## Data cleanup can also be done via DB(to do) (Vale)
     Navigate to categories page
     Add a category
     Add values to the mandatory Category fields
     Add values to non-mandatory fields
     Complete the category creation
     Verify Category is successfully created
     Delete new category(clenup data)
     Verify Category data is sccessfully cleaned


