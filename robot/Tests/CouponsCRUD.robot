*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/CouponGroupsPage.robot

*** Test Cases ***
TC_CategCRUD_1 CRUD scenario for Coupon Groups
    Navigate and verify Coupons Page
    Create a Coupon                                 ${mock_CouponName3}
    Single filter & Verify Coupon is created        ${mock_CouponName3}
    Edit Coupon with valid values                   ${mock_CouponName2}
    Verify Coupon can be updated with valid values  ${mock_CouponName2}
    Delete the Coupon                               ${mock_CouponName2}
    Reset Advanced Users filter