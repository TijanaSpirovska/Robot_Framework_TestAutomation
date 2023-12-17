*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CategoriesPage.robot
Resource          ../PageObjects/CreateCategory.robot
Resource          ../PageObjects/EditCategory.robot
Resource          ../PageObjects/DeleteCategory.robot
Resource          ../Resources/Testdata.robot
Resource           CategoriesPage.robot

*** Keywords ***
Delete a category that does not contain a product
    mouse over    ${DeleteCateg_DisabledButton}
    sleep    3
    page should contain    ${DeleteCateg_HoverText}
Cancel a category deletion
    Click button    ${canceldeletecateg_btn}
    wait until location is    ${categoriesurlpath}
    page should contain element    ${categoriestitle_text}
Verify Active category is not deleted
    location should be    ${categoriesurlpath}
    Filter Active category by single filters
    page should contain    ${ActiveCategory_slug}
Verify Inactive category is not deleted
    location should be    ${categoriesurlpath}
    Filter Inactive category by single filters
    page should contain    ${InactiveCategory_slug}





