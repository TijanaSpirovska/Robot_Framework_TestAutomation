*** Variables ***
${shipProvidersLink}                    //a[@href="/configuration/shipping-providers"]
${shipProvidersUrl}                     https://iwcuat-admin.iwcommerce.com/configuration/shipping-providers
${fedExTab}                             (//div[@class="custom-card-header card-header"])[1]
${easyPostTab}                          (//div[@class="custom-card-header card-header"])[2]
${fedExKeyInput}                        //input[@name="FEDEX_KEY"]
${fedExPasswordInput}                   //input[@name="FEDEX_PASSWORD"]
${fedExAccNrInput}                      //input[@name="FEDEX_ACCOUNT_NUMBER"]
${fedExMeterNrInput}                    //input[@name="FEDEX_METER_NUMBER"]
${fedExStatusChkBox}                    //label[@class="cb-label form-label" and @for="status"]

${fedExIsActive}                        //input[@id="status" and @checked]//ancestor::div[@class="cb-nice undefined"]
${groundShipping}                       //label[@class="cb-label form-label" and @for="FEDEX_GROUND"]
${grndShippingHomeDelivery}             //label[@class="cb-label form-label" and @for="FEDEX_HOME_DELIVERY"]
${costEffective}                        //label[@class="cb-label form-label" and @for="FEDEX_EXPRESS_SAVER"]
${overnightShippingEarly}               //label[@class="cb-label form-label" and @for="FIRST_OVERNIGHT"]

${overnightShippingAfternoon}           //label[@class="cb-label form-label" and @for="STANDARD_OVERNIGHT"]

${midmorning}                           //label[@class="cb-label form-label" and @for="PRIORITY_OVERNIGHT"]

${fastSecond}                           //label[@class="cb-label form-label" and @for="FEDEX_2_DAY"]

${2dayAM}                               //label[@class="cb-label form-label" and @for="FEDEX_2_DAY_AM"]

${easyPostInput}                        //input[@id="EASYPOST_KEY" ]
${easyPostStatusChkBox}                 //label[@class="cb-label form-label" and @for="statusEasyPost"]



${fedExActiveClass}                     //div[@class="shipping-provider" and contains (., "FedEx settings")]//span[@class="status active"]
${fedExInactiveClass}                   //div[@class="shipping-provider" and contains (., "FedEx settings")]//span[@class="status inactive"]
${easyPostActiveClass}                  //div[@class="shipping-provider" and contains (., "EasyPost USPS settings")]//span[@class="status active"]
${easyPostInactiveClass}                //div[@class="shipping-provider" and contains (., "EasyPost USPS settings")]//span[@class="status inactive"]

${SuccessfulyUpdate_Msg}                           Successfully updated Shipping Provider data!

${fedExAccNr_ErrorMsg}                   //div[@class="text-danger small" and text()='"cfg.FEDEX_ACCOUNT_NUMBER" is not allowed to be empty']
${fedExKey_ErrorMsg}                     //div[@class="text-danger small" and text()='"cfg.FEDEX_KEY" is not allowed to be empty']
${fedExPassword_ErrorMsg}               //div[@class="text-danger small" and text()='"cfg.FEDEX_PASSWORD" is not allowed to be empty']
${fedExMeterNr_ErrorMsg}                //div[@class="text-danger small" and text()='"cfg.FEDEX_METER_NUMBER" is not allowed to be empty']
${EasyPostKey_ErrorMsg}                  //div[@class="text-danger small" and text()='"cfg.EASYPOST_KEY" is not allowed to be empty']
${SelectConfigurationProfile1}           //a[@href="/configuration" and @class="text-left dropdown-item"]