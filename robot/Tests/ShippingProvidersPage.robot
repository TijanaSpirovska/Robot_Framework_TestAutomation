*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/ShippingProvidersPage.robot


*** Test Cases ***

TC000x_1 Activate Fedex
    Go to Shipping Providers Page
    Update & Activate FedEx Provider
    Confirm if the Provider is active    ${fedExActiveClass}

TC000x_2 Activate EasyPost
    Go to Shipping Providers Page
    Update & Activate Easy Post
    Confirm if the Provider is active    ${easyPostActiveClass}
#
TC000x_3 Deactivate & Clear FedEx
    Go to Shipping Providers Page
    Deactivate & Clear FedEx
    Confirm if the Provider is active    ${fedExInactiveClass}

TC000x_4 Deactivate & Clear EasyPost
    Go to Shipping Providers Page
    Deactivate & Clear EasyPost
    Confirm if the Provider is active    ${easyPostInactiveClass}

TC000X_5 Populate Fedex with missing mandatory fields
    Go to Shipping Providers Page
    Clear mandatory fields - Fedex
    Confirm That The Providers Can Not Be Updated - Fedex
TC000x_6 Populate Easypost with missing mandatory fields
    Go to Shipping Providers Page
    Clear Mandatory Fields - Easy Post
    Confirm that the providers can not be updated - Easy Post
