*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/PaymentProvidersPage.robot

*** Test Cases ***
TC000x_1 Activate Stripe
    Go to Payment Providers Page
    Update & Activate Stripe
    Confirm if the Provider is active    ${stripeActiveClass}


TC000x_2 Activate Square
    Go to Payment Providers Page
    Update & Activate Square
    Confirm if the Provider is active    ${squareActiveClass}


TC000x_3 Activate PayPal
    Go to Payment Providers Page
    Update & Activate PayPal
    Confirm if the Provider is active    ${paypalActiveClass}



#
TC000x_4 Deactivate & Clear Stripe
    Go to Payment Providers Page
    Deactivate & Clear Stripe
    Confirm if the Provider is active    ${stripeInactiveClass}




TC000x_5 Deactivate & Clear Square
    Go to Payment Providers Page
    Deactivate & Clear Square
    Confirm if the Provider is active    ${squareInactiveClass}




TC000x_6 Deactivate & Clear PayPal
    Go to Payment Providers Page
    Deactivate & Clear PayPal
    Confirm if the Provider is active    ${paypalInactiveClass}

TC000x_7 Populate Stripe with missing mandatory fields
    Go to Payment Providers Page
    Remove Mandatory Fileds - Stripe
    Confirm That The Providers Can Not Be Updated - Stripe

TC000x_8 Populate Square with missing mandatory fields
    Go To Payment Providers Page
    Remove Mandatory Fileds - Square
    Confirm That The Providers Can Not Be Updated - Square

TC000x_9 Populate Pay pal with missing mandatory fields
    Go To Payment Providers Page
    Remove Mandatory Fileds - Paypal
    Confirm That The Providers Can Not Be Updated - Pay Pal