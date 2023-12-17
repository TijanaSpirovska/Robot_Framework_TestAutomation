*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/CreateProduct.robot
Resource          ../Keywords/ProductsPage.robot


*** Test Cases ***
TC_ProdCRUD_1 CRUD scenario for Products
    Navigate and verify Products page
    Add a Product
    Add values to the required Product fields
    Add values to non-mandatory Product fields
    Complete the product creation
    Verify Master variant is created
    Filter Product by Name
    Access the Product Master variant
    Add necessary details for Master Variant data      ${filter_name_data}
    Update and verify variant data is added
    Filter Product by Name
    Access the Product Master variant
    Navigate and verify Variant photos tab page
    Upload and verify Variant photo
    Filter Product by Name
    Access the Product Master variant
    Navigate and verify Variant prices tab page
    Add and verify new variant prices