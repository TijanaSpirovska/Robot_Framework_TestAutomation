*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/CompaniesPage.robot


*** Test Cases ***
TC_0000x1 Create Company
    Navigate to Companies Page
    Add a new company
    Create Company
TC_0000x2 Create Company with missing mandatory fields
    Navigate to Companies Page
    Add a new company
    Create Company with missing mandatory values
TC_0000x3 Create a non-unique company
    Navigate to Companies Page
    Add a new company
    Create Company with duplicate name
TC_0000x4 Edit Company
    Navigate to Companies Page
    Filter Company by Advanced filters                ${mockTestCompanyName}
    sleep         2
    Navigate to Edit Company page
    Update an existing company                        ${mockTestCompanyName2}
    Single filter & Confirm                           ${mockTestCompanyName2}
TC_0000x5 Edit Company with missing mandatory fields
    Navigate to Companies Page
    Filter Company by Advanced filters                ${mockTestCompanyName}
    sleep         2
    Navigate to Edit Company page
    Update an existing company with missing mandatory values
TC_0000x6 Delete company - cancel
    Navigate to Companies Page
    Single filter & Confirm                         ${mockTestCompanyName2}
    Choose to delete company and cancel deletion
    Single filter & Confirm                         ${mockTestCompanyName2}
TC_0000x7 Delete company - confirm
    Navigate to Companies Page
    Single filter & Confirm                         ${mockTestCompanyName2}
    Delete the Company
    Advanced filter & Confirm element is not there  ${mockTestCompanyName2}


