*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/MainPage.robot
Resource    ../PageObjects/CouponGroupsPage.robot
Resource    ../Resources/Testdata.robot



*** Keywords ***
Navigate and verify Coupon Groups Page
    Wait until element is visible        ${discountsSideBarBtn}
    Click element                        ${discountsSideBarBtn}
    Click element                        ${couponGSideBarBtn}
    Location should be                   ${couponGroupsUrlPath}
    wait until element is visible        ${AddCouponGroup_Btn}
    wait until element is visible        ${couponGroupsTab}
    wait until element is visible        ${couponsTab}
    wait until element is visible        ${couponGroupPageTitle}
    wait until element is visible        ${table}
Navigate and verify Create Coupon Group Page
    click button                         ${AddCouponGroup_Btn}
    wait until element is visible        ${CreateCouponGroupPageTitle}
    wait until location is               ${createCouponGroupUrlPath}
    wait until element is visible        ${nameInputField}
    wait until element is visible        ${DescriptionTextBox}
 #  wait until element is visible        ${InputDescription}
    wait until element is visible        //input[@placeholder="mm/dd/yyyy h:mm aa"][1]
    wait until element is visible        (//input[@placeholder="mm/dd/yyyy h:mm aa"])[2]

Navigate to Create Coupon Group page
    Navigate and verify Coupon Groups Page
    Navigate and verify Create Coupon Group Page

#Choose Random Record in the table
#    Wait until page contains element     ${table}
#    ${elementCount}      Get Element Count        ${tableRow}
#    ${randomNumberInRange}    Evaluate  random.randint(1, ${elementCount})
#    return from keyword    ${randomNumberInRange}

Create Coupon Group
    [Arguments]     ${arg1}
    wait until element is visible        ${createBtn}
    Input text                           ${nameInputField}                          ${arg1}
    Input text                           ${validFrom}                               05/09/2023 5:00 PM
    Input text                           ${validTo}                                 05/09/2025 5:00 PM
    select frame    ${DescriptionTextBox}
    Input text      ${InputDescription}     ${mock_CouponGDesc}
    unselect frame
    Click button                         ${createBtn}
    Wait until location is               ${couponGroupsUrlPath}
Single filter & Verify Coupon Group is created
    [Arguments]    ${arg1}
    Wait until element is not visible    ${spiner}
    Wait until page contains element     ${singleFilter_field}
    click element                        ${singleFilter_NameField}
    Press Keys                           ${singleFilter_NameField}        ${filterName}           RETURN
    Input Text                           ${singleFilterInputField}    ${arg1}
    Click Element                        ${filterBtn}
    wait until element contains          ${table}                     ${arg1}
Create Coupon Group and verify it is created
    Create Coupon Group
    Single filter & Verify Coupon Group is created
Verify Coupon Group is successfully updated
    [Arguments]     ${arg1}
    Wait until element is visible        ${singleFilter_field}
    Click element                        //div[@class="switch-item" and contains(.,"Advanced")]
    Input text                           ${advancedNameInput}                       ${arg1}
    Click button                         ${filterBtn}
    wait until element is not visible    ${spiner}
    Wait Until Element Contains          ${table}        ${arg1}
Filter by Advanced filter
    [Arguments]     ${arg1}
    navigate and verify coupon groups page
    wait until element is not visible    ${spiner}
    click element                        ${advanced_Filter}
    wait until element is not visible    ${spiner}
    wait until element is visible        ${Advanced_filter_name}
    wait until element is visible        ${validFrom_filter}
    wait until element is visible        ${validTo_filter}
    wait until element is visible        ${filterBtn}
    wait until element is visible        ${resetBtn}
    input text                           ${Advanced_filter_name}      ${arg1}
    click button                         ${filterBtn}
Filter Coupon by Advanced filter
    Navigate and verify coupons page
    wait until element is not visible    ${spiner}
    click element                        ${advanced_Filter}
    wait until element is not visible    ${spiner}
    wait until element is visible        ${Advanced_filter_code}
    wait until element is visible        ${validFrom_filter}
    wait until element is visible        ${validTo_filter}
    wait until element is visible        ${Advanced_filter_status}
    wait until element is visible        ${filterBtn}
    wait until element is visible        ${resetBtn}
    input text                           ${Advanced_filter_code}      Updated
    click button                         ${filterBtn}
Advanced filter & Confirm element is there
    [Arguments]     ${arg1}
    Filter by Advanced filter
    Wait Until Element Contains          ${table}        ${arg1}
Advanced filter & Confirm element is not there
    [Arguments]     ${arg1}
    Filter by Advanced filter            ${mock_CouponGName2}
    Wait Until Element Does Not Contain  ${table}        ${arg1}
Reset Advanced Users filter
    Click Button                         ${resetBtn}
    Wait until element is not visible    ${tableSpinner}
    Wait until element is not visible    ${singleFilter_field}
Navigate and verify Coupons Page
    Wait until element is visible        ${discountsSideBarBtn}
    Click element                        ${discountsSideBarBtn}
    Click element                        ${couponGSideBarBtn}
    Location should be                   ${couponGroupsUrlPath}
    wait until element is visible        ${couponsTab}
    click element                        ${couponsTab}
    wait until location is               ${Coupons_Url}
    wait until element is visible        ${CouponPageTitle}
    wait until element is visible        ${AddCoupon_Btn}
    wait until element is visible        ${table}
Navigate and verify Edit Coupon Group page
    wait until element is not visible    ${spiner}
    wait until element is visible        ${editbtn}
    click element                        ${editbtn}
    wait until element is not visible    ${spiner}
    wait until element is visible        ${EditCouponGroupPageTitle}
    Wait until element is visible        ${validFrom}
    Wait until element is visible        ${validTo}
    Wait until element is visible        ${nameInputField}
   # Wait until element is visible        ${DescriptionTextBox}
Edit Coupon Group
    [Arguments]     ${arg1}
    input text                           ${nameInputField}      ${arg1}
    Click button                         ${updateBtn}
    sleep                                 3
Navigate to Edit Coupon Group page
    Navigate and verify Coupon Groups Page
Edit Coupon Group with missing mandatory fields values
    Click element                        ${nameInputField}
    Press keys                           ${nameInputField}            CTRL+A+DELETE
    Click element                        ${nameInputField}
    Press keys                           ${nameInputField}            CTRL+A+BACKSPACE
    sleep      3
    Click button                         ${updateBtn}
Verify Coupon Group can not be updated with missing mandatory values
    wait until location is not           ${couponGroupsUrlPath}
    wait until element is visible        ${EditCouponGroupPageTitle}
    wait until element is visible        ${CouponG_missingValues}
Delete Coupon Group
    [Arguments]     ${arg1}
    Wait until element is not visible    ${tableSpinner}
    Click element                        ${deleteBtn}
    Wait until element is visible        ${confirmationModal}
    Wait until element is visible        ${confirmBtn}
    Wait until element is visible        //button[@type="button" and contains (., "Cancel")]
    click button                         //button[@type="button" and contains (., "Cancel")]
    wait until location is               ${couponGroupsUrlPath}
    Wait Until Element contains          ${table}                           ${arg1}
    Click element                        ${deleteBtn}
    Click button                         ${confirmBtn}
    sleep                                2
    wait until element is not visible    ${spiner}
    Wait Until Element does not contain  ${table}                           ${arg1}
Create Coupon out of the Coupon Group dates range
    [Arguments]     ${arg1}
    ${Count}      Get Element Count      ${tableRow}
    ${CouponsBtn_last}   Catenate   SEPARATOR=	       ${Coupons_Btn}  [     ${Count}     ]
    wait until element is visible        ${CouponsBtn_last}
    click element                        ${CouponsBtn_last}
    wait until element is not visible    ${spiner}
    wait until element is visible        ${CouponPageTitle}
    wait until element contains          ${table}        ${No_data}
    wait until element is visible        ${AddCoupon_Btn}
    click button                         ${AddCoupon_Btn}
    wait until element is visible        ${CouponGroup_Coupon}
    wait until element contains          ${CouponGroup_Coupon}              Test Coupon Group
    wait until element is visible        ${CouponCode}
    wait until element is visible        ${CouponStatus}
    wait until element is visible        ${Coupon_ValidFrom}
    wait until element is visible        (//input[@placeholder="mm/dd/yyyy h:mm aa"and @value="05/09/2023 5:00 PM"])
    wait until element is visible        ${Coupon_ValidTo}
    wait until element is visible        (//input[@placeholder="mm/dd/yyyy h:mm aa"and @value="05/09/2025 5:00 PM"])
    wait until element is visible        ${DiscountType}
    wait until element is visible        ${CouponValue}
    wait until element is visible        ${AddNewCustomData_Btn}
    wait until element is visible        ${createCouponGBtn}
    input text                           ${CouponCode}                       ${arg1}
    click element                        ${Coupon_ValidFrom}
    Press keys                           ${Coupon_ValidFrom}                 CTRL+A+BACKSPACE
    sleep                                 2
    click element                        ${Coupon_ValidFrom}
    press keys                           ${Coupon_ValidFrom}                 05/09/2022 5:00 PM
    click element                        ${Coupon_ValidTo}
    Press keys                           ${Coupon_ValidTo}                 CTRL+A+BACKSPACE
    sleep                                 2
    click element                        ${Coupon_ValidTo}
    press keys                           ${Coupon_ValidTo}                   05/09/2026 5:00 PM
    sleep     2
    input text                           ${CouponValue}                      23
    Click button                         ${createcoupon_btn}
Verify Coupon can't be created out of Coupon Group dates range
    wait until page contains             Coupon does not match Coupon Group period between 5/9/2023, 5:00:00 PM and 5/9/2025, 5:00:00 PM
Create coupon in the Coupon Group dates range
    [Arguments]     ${arg1}
    ${Count}      Get Element Count      ${tableRow}
    ${CouponsBtn_last}   Catenate   SEPARATOR=	       ${Coupons_Btn}  [     ${Count}     ]
    wait until element is visible        ${CouponsBtn_last}
    click element                        ${CouponsBtn_last}
    wait until element is not visible    ${spiner}
    wait until element is visible        ${CouponPageTitle}
    wait until element contains          ${table}        ${No_data}
    wait until element is visible        ${AddCoupon_Btn}
    click button                         ${AddCoupon_Btn}
    wait until element is visible        ${CouponGroup_Coupon}
    wait until element contains          ${CouponGroup_Coupon}              Test Coupon Group
    wait until element is visible        ${CouponCode}
    wait until element is visible        ${CouponStatus}
    wait until element is visible        ${Coupon_ValidFrom}
    wait until element is visible        (//input[@placeholder="mm/dd/yyyy h:mm aa"and @value="05/09/2023 5:00 PM"])
    wait until element is visible        ${Coupon_ValidTo}
    wait until element is visible        (//input[@placeholder="mm/dd/yyyy h:mm aa"and @value="05/09/2025 5:00 PM"])
    wait until element is visible        ${DiscountType}
    wait until element is visible        ${CouponValue}
    wait until element is visible        ${AddNewCustomData_Btn}
    wait until element is visible        ${createCouponGBtn}
    input text                           ${CouponCode}                       ${arg1}
    sleep     2
    input text                           ${CouponValue}                      23
    Click button                         ${createcoupon_btn}
Verify Coupon can be created in the Coupon Group dates range
    wait until page contains             Successfully created coupon!
    wait until element is visible        ${CouponPageTitle}
    wait until element is visible        ${Coupon_In_CouponGroup}
    wait until element contains          ${table}        ${mock_CouponGName}
    wait until element contains          ${table}        ${mock_CouponName1}
    wait until element contains          ${table}        05/09/2023 05:00 PM
    wait until element contains          ${table}        05/09/2025 05:00 PM
Create a coupon
    [Arguments]     ${arg1}
    click element                        ${AddCoupon_Btn}
    wait until location is               ${CreateCoupon_Url}
    wait until element is visible        ${CreateCouponPageTitle}
    wait until element is visible        ${CouponGroup_Coupon_Empty}
    wait until element is visible        ${CouponCode}
    wait until element is visible        ${CouponStatus}
    wait until element is visible        ${Coupon_ValidFrom}
    press keys                           ${Coupon_ValidFrom}         05/10/2025 01:00 PM
    wait until element is visible        ${Coupon_ValidTo}
    press keys                           ${Coupon_ValidTo}           05/10/2027 01:00 PM
    wait until element is visible        ${DiscountType}
    wait until element is visible        ${CouponValue}
    wait until element is visible        ${AddNewCustomData_Btn}
    wait until element is visible        ${createCouponGBtn}
    press keys                           ${CouponCode}                       ${arg1}
    sleep     2
    input text                           ${CouponValue}              33
    click element                        ${AddNewCustomData_Btn}
    wait until element is visible        ${DeleteCustomData_Btn}
    wait until element is visible        ${CustomDataName}
    input text                           ${CustomDataName}           test name
    wait until element is visible        ${CustomDataValue}
    input text                           ${CustomDataValue}          test value
    click button                         ${createCouponGBtn}
Single filter & Verify Coupon is created
    [Arguments]     ${arg1}
    wait until page contains             Successfully created coupon!
    wait until location is               ${Coupons_Url}
    wait until element is not visible    ${spiner}
    click element                        ${SelectFilter_Coupons}
    press keys                           ${SelectFilter_Coupons}        Code      RETURN
    input text                           ${SingleFilter_by_Coupons}      ${arg1}
    sleep                                  2
    click button                         ${filterBtn}
    wait until element is not visible    ${spiner}
    wait until element contains          ${table}        ${arg1}
    wait until element contains          ${table}        05/10/2025 11:00 AM
    wait until element contains          ${table}        05/10/2027 11:00 AM
Single filter Coupon
    [Arguments]     ${arg1}
    wait until element is not visible    ${spiner}
    click element                        ${SelectFilter_Coupons}
    press keys                           ${SelectFilter_Coupons}        Code      RETURN
    input text                           ${SingleFilter_by_Coupons}      ${arg1}
    sleep                                  2
    click button                         ${filterBtn}
    wait until element is not visible    ${spiner}
    wait until element contains          ${table}        ${arg1}
Edit Coupuon with missing mandatory field values
    click element                        ${editBtn}
    wait until element is visible        ${EditCouponPageTitle}
    wait until element is visible        ${CouponGroup_Coupon_Empty}
    wait until element is visible        ${CouponCode}
    wait until element is visible        ${CouponStatus}
    wait until element is visible        ${Coupon_ValidFrom}
    wait until element is visible        ${Coupon_ValidTo}
    wait until element is visible        ${DiscountType}
    wait until element is visible        ${CouponValue}
    wait until element is visible        ${AddNewCustomData_Btn}
    wait until element is visible        ${updateBtn}
    wait until element is visible        ${DeleteCustomData_Btn}
    wait until element is visible        ${CustomDataName}
    wait until element is visible        ${CustomDataValue}
    press keys                           ${CouponCode}          CTRL+A+BACKSPACE
    press keys                           ${CouponValue}         CTRL+A+BACKSPACE
    press keys                           ${CustomDataName}      CTRL+A+BACKSPACE
    press keys                           ${CustomDataValue}     CTRL+A+BACKSPACE
    click button                         ${updateBtn}
Verify Coupon can not be updated with missing mandatory values
    wait until element is visible        ${EditCouponPageTitle}
    wait until element is visible        ${MissingCouponCode}
    wait until element is visible        ${MissingCouponValue}
    wait until element is visible        ${MissingCustomDataName}
    wait until element is visible        ${MissingCustomDataValue}
Edit Coupon with valid values
    [Arguments]     ${arg1}
    click element                        ${editBtn}
    wait until element is visible        ${EditCouponPageTitle}
    press keys                           ${CouponCode}          CTRL+A+BACKSPACE
    sleep                                2
    input text                           ${CouponCode}          ${arg1}
    click button                         ${updateBtn}
Verify Coupon can be updated with valid values
    [Arguments]     ${arg1}
    wait until location is               ${Coupons_Url}
    wait until page contains             Successfully updated Coupon data!
    wait until element is not visible    ${spiner}
    wait until element is visible        ${couponpagetitle}
    single filter coupon                 ${arg1}
Delete the Coupon
    [Arguments]     ${arg1}
    Filter Coupon by Advanced filter
    wait until element is not visible    ${spiner}
    wait until element is visible        ${deleteBtn}
    click element                        ${deleteBtn}
    wait until element is visible        ${confirmationModal}
    wait until element is visible        //button[@type="button" and contains(.,"Cancel")]
    click button                         //button[@type="button" and contains(.,"Cancel")]
    wait until element is visible        ${deleteBtn}
    click element                        ${deleteBtn}
    wait until element is visible        ${confirmationModal}
    wait until element is visible        ${confirmBtn}
    click button                         ${confirmBtn}
Verify Coupon is successfully deleted
    wait until element is not visible    ${spiner}
    wait until element does not contain  ${table}       ${deleteBtn}[1]
    wait until element does contains     ${table}       ${no_data}
Cleanup data
    Navigate and verify Coupons Page
    filter by advanced filter                          ${mock_CouponName1}
    Delete the Coupon                                  ${mock_CouponName1}
    Reset Advanced Users filter
    Navigate and verify Coupon Groups Page
    Single filter & Verify Coupon Group is created    ${mock_CouponGName}
    Delete Coupon Group                               ${mock_CouponGName}
    Advanced filter & Confirm element is not there    ${mock_CouponGName}
    Reset Advanced Users filter                       ${mock_CouponGName}






