*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/TaxProvidersPage.robot

*** Test Cases ***

TC000x_1 Deactivate/Activate TaxJar
    Confirm if the Provider is active
    Deactivate & Verify TaxJar is deactivated
    Activate & Verify TaxJar is activated






