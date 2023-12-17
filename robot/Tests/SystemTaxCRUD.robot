*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/SystemTaxPage.robot

*** Test Cases ***
TC_SystemTaxCRUD_1 CRUD scenario for System Tax
    Navigate and verify System Tax page
    Add/Create a new System Tax                     ${SystemTax_MockText}
    Verify new System Tax is successfully created   ${SystemTax_MockText}
    Edit System Tax                                 ${SystemTax_MockText2}
    Verify System Tax is successfully updated       ${SystemTax_MockText2}
    Switch to Single filter
    Delete a System Tax                             ${SystemTax_MockText2}
    Verify System Tax is successfully deleted       ${SystemTax_MockText2}