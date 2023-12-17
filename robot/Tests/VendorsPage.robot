*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/VendorsPage.robot


*** Test Cases ***
TC_0000x1 Edit Random Vendor
    Go to Vendors Page
    Choose Random Vendor
    Edit Vendor

