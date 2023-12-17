*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/GiftCardsPage.robot


*** Test Cases ***
TC_GiftCard_1 Create Gift Card
    Go to Gift Cards Page
    Go To Create Gift Card Page
    Create Gift Card
TC_GiftCard_2 Filter Giftcard by single filter
    Go to Gift Cards Page
    Verify Single filter is enabled
    Filter GiftCard by Customer Email         ${GiftCard_email}
    Filter GiftCard by Total Amount
    Filter GiftCard by Status
    Filter GiftCard by Redeem Amount
    Filter GiftCard by Valid from
    Filter GiftCard by Valid to

TC_GiftCard_3 Filter Giftcard by Advanced filter
    Go to Gift Cards Page
    Verify Advanced filter is enabled
    Filter GiftCard by Customer email-Advanced
    Filter GiftCard by Total Amount-Advanced
    Filter GiftCard by Redeem Amount-Advanced
    Filter GiftCard by Status - Advanced
    Filter GiftCard by Valid from-Advanced
    Filter GiftCard by Valid to-Advanced


TC_GiftCard_4 Edit Gift Card
    Go to Gift Cards Page
    Filter GiftCard by Customer Email         ${GiftCard_email}
    Edit Gift Card


TC_GiftCard_5 Exporting Gift Cards
    Go to Gift Cards Page
    Filter GiftCard by Customer Email         ${mockTestCustomerEmail2}
    Choose cancel when exporting the Gift Card - Selected Gift Card
    Choose confirm when exporting the Gift Card - Selected Gift Card
    Choose cancel when exporting the Gift Card - All Gift Cards
    Choose confirm when exporting the Gift Card - All Gift Cards

TC_GiftCard_6 Delete Gift card
    Go to Gift Cards Page
    Delete Gift Card                         ${mockTestCustomerEmail2}


