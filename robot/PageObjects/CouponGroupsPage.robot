*** Variables ***

${couponGSideBarBtn}                        //a[@href="/promotions/coupon-groups"]
${couponGroupPageTitle}                     //span[@class="page-title" and contains(.,"Coupon Groups")]
${CreateCouponGroupPageTitle}               //span[@class="page-title" and contains(.,"Create Coupon Group")]
${couponGroupsTab}                          //*[@href="/promotions/coupon-groups" and contains(.,"Coupon Groups")]
${couponsTab}                               //*[@href="/promotions/coupons" and contains(.,"Coupons")]
${advancedNameInput}                        //input[@id="name"]
${AddCouponGroup_Btn}                       //button[@type="link" and contains(.,"+ Add Coupon Group")]

# Single filter names
${filterName}                               Name
${filterValidFrom}                          Valid from
${filterValidTo}                            Valid to

# Create Coupon Group Page elements
${nameInputField}                           //input[@data-name="name"]
${description}                              //textarea
${createCouponGBtn}                         //button[@type="submit" and contains(.,"Create")]
${Advanced_filter_code}                     //input[@id="code"]
${Advanced_filter_status}                   //div[contains(@class,"select__placeholder") and contains(.,"Status")]

${AddCouponGroup_Btn}                       //button[@type="link" and contains(.,"+ Add Coupon Group")]
${EditCouponGroupPageTitle}                 //span[@class="page-title" and contains(.,"Coupon Group Data")]
${CouponG_missingValues}                    //div[contains(@class,"border-danger")]
${Coupons_Btn}                              (//span[@class="count"])
${CouponPageTitle}                          //span[@class="page-title" and contains(.,"Coupons")]
${AddCoupon_Btn}                            //button[@type="link" and contains(.,"+ Add Coupon")]
${CreateCouponPageTitle}                    //span[@class="page-title" and contains(.,"Create Coupon")]
${EditCouponPageTitle}                      //span[@class="page-title" and contains(.,"Edit Coupon")]
${CouponGroup_Coupon}                       //*[@class=" css-107lb6w-singleValue" and contains(.,"Test Coupon Group")]
${CouponCode}                               //input[@id="code"]
${Coupon_ValidFrom}                         (//input[@placeholder="mm/dd/yyyy h:mm aa"])[1]
${Coupon_ValidTo}                           (//input[@placeholder="mm/dd/yyyy h:mm aa"])[2]
${CouponStatus}                             //*[@id="status"]
${DiscountType}                             //*[@id="discount_type"]
${CouponValue}                              //*[@placeholder="Value..."]
${AddNewCustomData_Btn}                     //button[contains(.,"+ Add new")]
${DeleteCustomData_Btn}                     //span[@class="ml-1" and contains(.,"Delete")]
${CustomDataName}                           //input[@id="name_0"]
${CustomDataValue}                          //input[@id="value_0"]
${CreateCoupon_Btn}                         //button[@type="submit" and contains(.,"Create")]
${Coupon_In_CouponGroup}                    //span[@class="mr-2" and contains(.,"Test Coupon Group")]
${CouponGroup_Coupon_Empty}                 //*[@class=" css-oefkzl-placeholder"]
${SelectFilter_Coupons}                     //*[@id="singleSelectedFilterStatus"]
${SingleFilter_by_Coupons}                  //input[contains(@placeholder,"Code")]
${MissingCouponCode}                        //label[contains(.,"Coupon code")]//following::div[contains(@class,"danger")]
${MissingCouponValue}                       (//label[contains(.,"Value")]//following::div[contains(@class,"danger")])[1]
${MissingCustomDataName}                    (//label[ contains(.,"Name")]//following::div[contains(@class,"danger")])[1]
${MissingCustomDataValue}                   (//label[contains(.,"Value")]//following::div[contains(@class,"danger")])[3]