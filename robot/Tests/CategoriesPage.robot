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
Resource          ../Keywords/CategoriesPage.robot


*** Test Cases ***
TC_Categ_1 Verify Categories page is reachable
#User navigates and verifies Categories page (Vale)
    Navigate to Categories page
    Verify Categories page
TC_Categ_2 Filter Categories using Single filters        #verification still not added
#User navigates to Categories page and verifies Single filters (Vale)
    Navigate to Categories page
    Filter Active category by Single filters
#TC_Categ_3 Filter Categories using Advanced filters     #verification still not added
