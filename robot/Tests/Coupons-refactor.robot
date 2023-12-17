*** Settings ***
Test Setup        Open Admin app and Login with valid credintials
Test Teardown     Close Browser
Library     SeleniumLibrary
Resource    ../Keywords/Common.robot
Resource    ../Keywords/CouponGroupsPage.robot

*** Test Cases ***
TC_0000x1 Create Coupon from Coupon Groups page, out of dates range
    Navigate to Create Coupon Group page
    Create Coupon Group                               ${mock_CouponGName}
    Single filter & Verify Coupon Group is created    ${mock_CouponGName}
    Create coupon out of the Coupon Group dates range  ${mock_CouponName1}
    Verify Coupon can't be created out of Coupon Group dates range
TC_0000x2 Create Coupon from Coupon Groups page in dates range
    Navigate and verify Coupon Groups Page
    Single filter & Verify Coupon Group is created    ${mock_CouponGName}
    Create coupon in the Coupon Group dates range     ${mock_CouponName1}
    Verify Coupon can be created in the Coupon Group dates range
    Cleanup data
TC_0000x3 Create Coupon from Coupons page
    Navigate and verify Coupons Page
    Create a Coupon                                 ${mock_CouponName3}
    Single filter & Verify Coupon is created        ${mock_CouponName3}

TC_0000x4 Edit the Coupon with missing mandatory fields
    Navigate and verify Coupons Page
    Single filter Coupon                             ${mock_CouponName3}
    Edit Coupuon with missing mandatory field values
    Verify Coupon can not be updated with missing mandatory values
TC_0000x5 Single filter & Edit the Coupon Group
     Navigate and verify Coupons Page
     Single filter Coupon                             ${mock_CouponName3}
     Edit Coupon with valid values                    ${mock_CouponName2}
     Verify Coupon can be updated with valid values   ${mock_CouponName2}
TC_0000x6 Advanced filter & Delete Coupon
    Navigate and verify Coupons Page
    filter by advanced filter                          ${mock_CouponName2}
    Delete the Coupon                                  ${mock_CouponName2}
    Reset Advanced Users filter