*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/CouponGroupsPage.robot

*** Test Cases ***
TC_0000x1 Create Coupon Group
    Navigate and verify Coupon Groups Page
    Navigate and verify create coupon group page
    Create Coupon Group                               ${mock_CouponGName}
    Single filter & Verify Coupon Group is created    ${mock_CouponGName}

TC_0000x2 Edit the Coupon Group with missing mandatory fields
    Navigate and verify Coupon Groups Page
    Single filter & Verify Coupon Group is created    ${mock_CouponGName}
    Navigate and verify Edit Coupon Group page
    Edit Coupon Group with missing mandatory fields values
    Verify Coupon Group can not be updated with missing mandatory values
TC_0000x3 Edit the Coupon Group
    Navigate and verify Coupon Groups Page
    Single filter & Verify Coupon Group is created    ${mock_CouponGName}
    Navigate and verify Edit Coupon Group page
    Edit Coupon Group
    Verify Coupon Group is successfully updated       ${mock_CouponGName2}
#
TC_0000x4 Advanced filter & Delete Coupon Group
    Navigate and verify Coupon Groups Page
    Single filter & Verify Coupon Group is created    ${mock_CouponGName2}
    Delete Coupon Group                               ${mock_Coupongname2}
    Advanced filter & Confirm element is not there    ${mock_CouponGName2}
    Reset Advanced Users filter                       ${mock_CouponGName2}