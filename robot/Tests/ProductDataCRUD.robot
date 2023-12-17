*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/ProductDataCRUD.robot

*** Test Cases ***
#User tries to create Product Type by missing mandatory field values during creation
TC_ProdData_1 Create a Product Type with missing mandatory fields
    Navigate to Product Data page
    Verify Product Data page
    Create a new Product Type
    Verify New Product Type is not created
###User tries to create Product Type by adding all mandatory field values during creation
TC_ProdData_2 Create a Product Type with all mandatory field values added
    Navigate to Product Data page
    Verify Product Data page
    Fill in mandatory data for a new Product Type      ${mock_producttype}
    Create a new Product Type
    Verify New Product Type is created                 ${mock_producttype}
##User tries to create Product Price by missing mandatory field values during creation
TC_ProdData_2.1 Delete a Product Type
    Navigate to Product Data page
    Verify Product Data page
    Delete Product type
    Verify New Product Type is deleted                 ${mock_producttype}
TC_ProdData_3 Create a Product Price with missing mandatory fields
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Prices section
    Create a new Product Price
    Verify New Product Price is not created
#User tries to create Product Price by adding all mandatory field values during creation
TC_ProdData_4 Create a Product Price with all mandatory fields
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Prices section
    Fill in mandatory data for a new Product Price      ${mocktestvalue}
    Create a new Product Price
    Verify New Product Price is created                 ${mocktestvalue}
TC_ProdData_4.1 Delete a Product Price
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Prices section
    Delete Product Price
    sleep                       5
    Verify New Product Price is deleted                 ${mocktestvalue}
#User tries to create Product attribute by adding all mandatory field values during creation
TC_ProdAtt_1 Create Product Attribute with missing mandatory fields
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Add new Product Attribute
    Create a new Product Attribute
    Verify Product Attribute is not created
#User tries to create Product attribute by adding all mandatory field values during creation
TC_ProdData_2 Create a Product Attribute with all mandatory fields
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Add new Product Attribute
    Fill in Product Attribute data                      ${product_attdataname}
    Create a new Product Attribute
    Verify Product Attribute is created                 ${product_attdataname}
##User verifies Product attribute Single filters
TC_ProdData_3 Verify Product Attrubute Data Page and Single filters
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Verify Single filter is enabled for Product Attributes
    Filter Product Attribute by Name filters          ${product_attdataname}
    Verify Product Attribute filtering                ${product_attdataname}
    Filter Product Attribute by Type filters
#
##User verifies Product attribute Advanced filters
TC_ProdData_4 Verify Product Attribute Advanced fitlers
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Filter Product Attribute by Advanced-Name filters        ${product_attdataname}
    Verify Product Attribute filtering                       ${product_attdataname}
    Filter Product Attribute by Advanced-Type filters        ${product_attdataname}
##User tries to edit Product attribute by missing mandatory field values during editing
TC_ProdData_5 Edit Product attribute with missing mandatory data
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Edit Product Attribute by removing mandatory data
    Verify Product Attribute is not updated
###User tries to edit Product attribute by adding all mandatory field values during editing
TC_ProdData_6 Edit a Product attribute by adding new data
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Edit Product Attribute by adding valid data                   ${product_attdataname}
    Verify Product Attribute is updated
##User tries to delete Product attribute by using the Cancel delete button
TC_ProdData_7 Delete Product attribute by using Cancel button
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Choose Cancel when deleting a Product attribute
    Verify Product attribute is not deleted
###User tries to delete Product attribute by using the Confirm delete button
TC_CustData_8 Delete Product attribute by using Confirm button
    Navigate to Product Data page
    Verify Product Data page
    Navigate and verify Product Attributes section
    Choose Confirm when deleting a Product attribute
    Verify Product attribute is deleted
