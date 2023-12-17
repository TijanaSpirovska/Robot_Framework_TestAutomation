*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library           SeleniumLibrary
Library           String

Resource          ../Keywords/Common.robot
Resource          ../Keywords/IWCinvoice.robot
Resource          ../Keywords/Common.robot

*** Test Cases ***


Sccesfully Create Invoice
    Navigate to Invoice modal-dialog
    Confrm Invoice createion

Cancel Invoice createion
    Navigate to Invoice modal-dialog
    cancel invoice creation

Cancel invoice creation by closing the dialog
    Navigate to Invoice modal-dialog
    Close Invoice modal-dialog