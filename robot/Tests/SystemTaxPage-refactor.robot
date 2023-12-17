*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/SystemTaxPage.robot


*** Test Cases ***
TC_0000x1 Create System Tax
    Navigate and verify System Tax page
    Add/Create a new System Tax                       ${SystemTax_MockText}
    Verify new System Tax is successfully created     ${SystemTax_MockText}
TC_0000x2 Edit System Tax
    Navigate and verify System Tax page
    Edit System Tax                                  ${SystemTax_MockText2}
    sleep                                            3
    Verify System Tax is successfully updated        ${SystemTax_MockText2}
TC_0000x4 Delete System Tax
    Navigate and verify System Tax page
    Delete a System Tax                              ${SystemTax_MockText2}
    Verify System Tax is successfully deleted        ${SystemTax_MockText2}


