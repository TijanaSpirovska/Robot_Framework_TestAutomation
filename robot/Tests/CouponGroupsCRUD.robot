*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/CouponGroupsPage.robot

*** Test Cases ***
TC_CategCRUD_1 CRUD scenario for Coupon Groups
    Navigate and verify Coupon Groups Page
    Navigate and verify create coupon group page
    Create Coupon Group                               ${mock_CouponGName}
    Single filter & Verify Coupon Group is created    ${mock_CouponGName}
    Navigate and verify Edit Coupon Group page
    Edit Coupon Group                                 ${mock_CouponGName2}
    Verify Coupon Group is successfully updated       ${mock_CouponGName2}
    Delete Coupon Group                               ${mock_Coupongname2}
    Advanced filter & Confirm element is not there    ${mock_CouponGName2}
    Reset Advanced Users filter                       ${mock_CouponGName2}