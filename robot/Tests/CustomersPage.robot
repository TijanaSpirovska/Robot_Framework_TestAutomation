*** Settings ***

Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/Common.robot
Resource          ../Keywords/Login.robot
Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/LoginPage.robot
Resource          ../PageObjects/HomePage.robot
Resource          ../Keywords/CustomersPage.robot


*** Test Cases ***
TC_Custom_1 Verify Customers page is reachable
#User navigates and verifies Customers page
    Navigate to Customers page
    Verify Customers page
TC_Custom_2 Filter Customers using Single filters
#User navigates to Cstomers page and verifies Single filters
    Navigate to Customers page
    Verify Customers Page
    Filter customer by Single-First Name filters
    Filter customer by Single-Last Name filters
    Filter customer by Single-Username filters
    Filter customer by Single-Customer Email filters
    Filter customer by Single-Phone filters
TC_Custom_3 Filter Customers using Advanced filters
    Navigate to Customers page
    Verify Customers Page
    Verify Advanced filter is enabled
    Filter customer by Advanced-First Name filters
    Filter customer by Advanced-Last Name filters
    Filter customer by Advanced-Username filters
    Filter customer by Advanced-Customer Email filters
    Filter customer by Advanced-Phone filters
TC_Custom_4 Archive Customers
    Navigate to Customers page
    Verify Customers Page
    Choose cancel when modifying the product - Archive selcted
    Choose confirm when modifying the customer - Archive selected
    Choose cancel when modifying the customer - Archive All found
    Choose confirm when modifying the customer - Archive All found
TC_Custom_5 Filter Archived Customers using Single filters
    Navigate to Customers page
    Verify Customers Page
    Filter Archived Customers
    Filter customer by Single-First Name filters
    Filter customer by Single-Last Name filters
    Filter customer by Single-Username filters
    Filter customer by Single-Customer Email filters
    Filter customer by Single-Phone filters
TC_Custom_6 Filter Archived Customers using Advanced filters
    Navigate to Customers page
    Verify Customers Page
    Verify Advanced filter is enabled
    Filter Archived Customers
    Filter customer by Advanced-First Name filters
    Filter customer by Advanced-Last Name filters
    Filter customer by Advanced-Username filters
    Filter customer by Advanced-Customer Email filters
    Filter customer by Advanced-Phone filters
TC_Custom_7 Unarchive Customers
    Navigate to Customers page
    Verify Customers Page
    Choose confirm when modifying the customer - Unarchive selected
    Choose cancel when modifying the customer - Unarchive selected
    Choose cancel when modifying the customer - Unarchive all
    Choose confirm when modifying the customer - Unarchive all
TC_Custom_8 Exporting customers
    Navigate to Customers page
    Verify Customers page
    Choose cancel when exporting the customer - Selected customer
    Choose confirm when exporting the customer - Selected customer
    Choose cancel when exporting the customer - All customers
    Choose confirm when exporting the customer - All customers