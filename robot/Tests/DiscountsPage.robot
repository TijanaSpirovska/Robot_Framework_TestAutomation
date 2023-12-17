*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/DiscountsPage.robot

*** Test Cases ***
TC_Discount_1 Create Discount
    Go to Discounts Page
    Go To Create Discount Page
    Create Discount

TC_Discount_2 Create Discount with missing mandatory fields
    Go to Discounts Page
    Filter Discount by Name           ${mockTestDiscountName}
    Create Discount with missing mandatory fields
    Verify Discount is not created
TC_Discount_3 Filter Discount by single filter
    Go to Discounts Page
    Verify Single filter is enabled
    Filter Discount by Name           ${mockTestDiscountName}
    Filter Discount by Priority
    Filter Discount by Type
    Filter Discount by Value
    Filter Discount by Active from
    Filter Discount by Active to
TC_Discount_4 Filter Discount by advanced filter
    Go to Discounts Page
    Verify Advanced filter is enabled
    Filter Discount by Name-Advanced
    Filter Discount by Value-Advanced
    Filter Discount by Priority-Advanced
    Filter Discount by Type - Advanced
    Filter Discount by Active from-Advanced
    Filter Discount by Active to-Advanced

###
TC_Discount_5 Edit Discount
    Go to Discounts Page
    Verify Single filter is enabled
    Filter Discount by Name     ${mockTestDiscountName}
    Edit Discount
    Filter Discount by Name     ${mockTestDiscountName2}

TC_Discount_6 Delete Discount
    Go to Discounts Page
    Filter Discount by Name                         ${mockTestDiscountName2}
    Delete Discount
    Verify discount is deleted                      ${mockTestDiscountName2}



#TC_0001 Discount CRUD operations + test if changes are persisted
#    Go to Discounts Page
#    Go To Create Discount Page
#    Create Discount
#    Single filter & Confirm                           ${mockTestDiscountName}    ${filterName}
#    Edit Discount
#    Advanced filter & Confirm element is there        ${mockTestDiscountName2}   ${filterName}
#    Delete Discount
#    Single filter & Confirm Element is Deleted        ${mockTestDiscountName2}   ${filterName}
##    Advanced filter & Confirm element is not there    ${mockTestDiscountName2}
#    Change the filter type                            ${mocktestdiscountname2}
#
#TC_0001 Discount CRUD operations
#    Go to Discounts Page
#    Go To Create Discount Page
#    Create Discount
#    sleep           10
#    Verify Single filter is enabled
#    Filter Discount by Name     ${mockTestDiscountName}
#    Edit Discount
#    Filter Discount by Name                         ${mockTestDiscountName2}
#    Delete Discount
#    Verify discount is deleted