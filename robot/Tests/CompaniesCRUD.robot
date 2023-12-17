*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/CompaniesPage.robot

*** Test Cases ***
TC_CompanyCRUD_1 CRUD scenario for Companies
     Navigate to Companies Page
     Add a new company
     Create Company
     Filter Company by Advanced filters                ${mockTestCompanyName}
     Navigate to Edit Company page
     Update an existing company                        ${mockTestCompanyName2}
     Single filter & Confirm                           ${mockTestCompanyName2}
     Delete the Company
     Advanced filter & Confirm element is not there    ${mockTestCompanyName2}
