*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/CreateCategory.robot
Resource          ../Keywords/CategoriesPage.robot
Resource          ../Keywords/EditCategory.robot
Resource          ../Keywords/DeleteCategory.robot

*** Test Cases ***
TC_CategCRUD_1 CRUD scenario for Categories

     Navigate to categories page
     Add a category
     Add values to the mandatory Category fields
     Add values to non-mandatory fields
     Complete the category creation
     Verify Category is successfully created
     Navigate to Edit Category page
     Verify the Edit Category page contains all the default elements
     Add data to existing Category Name data field
     Update edited Category
     Verify CRUD Category can be updated
     Filter Updated Category
     Delete new category(clenup data)
     Filter Deleted Category