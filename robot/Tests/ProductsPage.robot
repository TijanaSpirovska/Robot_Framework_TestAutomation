*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/ProductsPage.robot

*** Test Cases ***
TC_Products_1 Verify user can navigate to Products page
    Navigate and verify Products page
TC_Products_2 Verify Product Single filters
    Navigate and verify Products page
    Verify Single filter is enabled
    Filter Product by Name
    Filter Product by Category
    Filter Product by Slug
    Filter Product by Status
    Filter Product by Created at


TC_Products_3Verify Product Advanced filters
    Navigate and verify Products page
    Verify Advanced filter is enabled
    Filter Product by Name-Advanced
    Filter Product by Category-Advanced
    Filter Product by Slug-Advanced
    Filter Product by Status-Advanced
    Filter Product by Created at-Advanced

TC_Products_4 Modify the product's status
    Navigate and verify Products page
    Filter Product by Name
    Choose cancel when modifying the product - Selected products
    Choose confirm when modifying the product - Selected products
    Choose cancel when modifying the product - All products
    Choose confirm when modifying the product - All products
TC_Products_5 Exporting products
    Navigate and verify Products page
    Choose cancel when exporting the product - Selected products
    Choose confirm when exporting the product - Selected products
    Choose cancel when exporting the product - All products
    Choose confirm when exporting the product - All products

