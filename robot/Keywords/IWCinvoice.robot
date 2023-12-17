*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/IWCinvoice.robot
Resource          ../Resources/Testdata.robot

*** Keywords ***

Navigate to Orders page
    click element                             ${orders_link}
    sleep                                     5
    Wait until page contains element          ${orders_page_title}
    location should contain                   ${orders_page}
Use Invoice option for existing order
    click element                             ${invoice_btn}
    wait until page contains element          ${Invoice_modalDialog}
Navigate to Invoice modal-dialog
    Navigate to Orders page
    Use Invoice option for existing order
Cancel Invoice creation
    click button                              ${Cancel_invoice_btn}
    wait until page does not contain element  ${Invoice_modalDialog}
    location should contain                   ${orders_page}
Confrm Invoice createion
    click button                              ${Confirm_invoice_btn}
    wait until page contains                  ${Successful_Invoice_message}
  # location should contain                 ${Invoice_url}
Close Invoice modal-dialog
    click button                              ${Close_btn}
    wait until page does not contain element  ${Invoice_modalDialog}
    location should contain                   ${orders_page}