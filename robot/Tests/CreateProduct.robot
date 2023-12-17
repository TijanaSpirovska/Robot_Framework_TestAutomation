*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/CreateProduct.robot
Resource          ../Keywords/ProductsPage.robot

*** Test Cases ***
##User verifies that a Product can not be created with missing mandatory fields in Product data page
#TC_CreProd_1 Create a product with missing mandatory fields
#    Navigate and verify Products page
#    Add a Product
#    Add values to the required Product fields
#    Add values to non-mandatory Product fields
#    Delete data from mandatory Product field
#    Complete the product creation
#    Verify product can not be created

##User creates a product by populating only mandatory fields in Product data page
#TC_CreProd_2 Create a product with mandatory fields only
#    Navigate and verify Products page
#    Add a Product
#    Add values to the required Product fields
#    Add values to non-mandatory Product fields
#    Complete the product creation
#    Verify Master variant is created
#
#TC_CreProd_3 Create a product with already taken slug
#    Navigate and verify Products page
#    Add a Product
#    Add values to the required Product fields
#    Add values to non-mandatory Product fields
#    Complete the product creation
#    Verify product can not be created with existing slug
#    Test product cleanup data - Confirm Button

##User creates a product by populating both mandatory fields + non-mandatory in Product data page
#TC_CreProd_4 Create a product with mandatory & non-mandatory fields
#    Navigate and verify Products page
#    Add a Product
#    Add values to the required Product fields
#    Add values to non-mandatory Product fields
#    Complete the product creation
#    Verify Master variant is created
#
#User configures the necessary Master variant data
TC_CreProd_5 Setup Master variant data
      Navigate and verify Products page
      Filter Product by Name
      Access the Product Master variant
      Add necessary details for Master Variant data      ${Product_Name}
      Update and verify variant data is added
TC_CreProd_6 Set up Master variant data with missing mandatory fileds
       Navigate And Verify Products Page
       Filter Product By Name
       Access The Product Master Variant
       Remove Necessary Details For Master Variant Data
       Update the variant data and confirm that it has not been added
#User uploads photos to the  Master variant data and verifues photo has been uploaded
TC_CreProd_7 Setup Master variant photos
      Navigate and verify Products page
      Filter Product by Name
      Access the Product Master variant
      Navigate and verify Variant photos tab page
      Upload and verify Variant photo

TC_CreProd_8 Setup Master variant photos with missing mandatory fields
      Navigate and verify Products page
      Filter Product by Name
      Access the Product Master variant
      Navigate and verify Variant photos tab page
      Remove photo from Product Variant photos
##User adds and defines Master variant prices
TC_CreProd_9 Setup Master variant prices
      Navigate and verify Products page
      Filter Product by Name
      Access the Product Master variant
      Navigate and verify Variant prices tab page
      Add and verify new variant prices
TC_CreProd_10 Setup Master variant prices with missing mandatory fields
    Navigate and verify Products page
    Filter Product by Name
    Access the Product Master variant
    Navigate and verify Variant prices tab page
    Add empty Price and verify is not created
TC_CreProd_11 Add new variant
    Navigate and verify Products page
    Filter Product by Name
    Add New Varriant
    Add necessary details for Master Variant data       Color
    Create and verify a new variant data is added
    Delete new product variant
#User clones a Master variant and verifies Cloned variant is created
TC_CreProd_12 Clone a variant from Master variant
      Navigate and verify Products page
      Filter Product by Name
      Navigate and verify Variants page
      Clone and Verify Cloned variant is created


TC_CreProd_13 Delete a product with variants setup
     Navigate and verify Products page
     Filter Product by Name
     Test product cleanup data - Cancel Button
     Test product cleanup data - Confirm Button


