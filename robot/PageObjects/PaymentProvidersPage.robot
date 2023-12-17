*** Variables ***

${paymentProvidersLink}                 //a[@href="/configuration/payment-providers"]
${paymentProvidersUrl}                  https://iwcuat-admin.iwcommerce.com/configuration/payment-providers


${stripeTab}                            (//div[@class="card"])[1]
${stripePublicKeyInput}                 //input[@id='STRIPE_KEY']
${stripeSecretKeyInput}                 //input[@id='STRIPE_SECRET']
${stripeStatusChkBox}                   //label[@for='stripeSelected']
${stripeActiveClass}                    //div[@class="shipping-provider" and contains (., "Stripe settings")]//span[@class="status active"]
${stripeInactiveClass}                  //div[@class="shipping-provider" and contains (., "Stripe settings")]//span[@class="status inactive"]
${stripeIsActive}                       //input[@id="stripeSelected" and @checked]

${squareTab}                            (//div[@class="card"])[2]
${squareAppIdInput}                     //input[@id="SQUARE_APPLICATION_ID"]
${squareTokenInput}                     //*[@id="SQUARE_TOKEN"]
${squareLocationInput}                  //*[@id="SQUARE_LOCATION"]
${squareStatusChkBox}                   //label[@for='squareSelected']
${squareActiveClass}                    //div[@class="shipping-provider" and contains (., "Square settings")]//span[@class="status active"]
${squareInactiveClass}                  //div[@class="shipping-provider" and contains (., "Square settings")]//span[@class="status inactive"]
${squareIsActive}                       //input[@id="squareSelected" and @checked]


${payPalTab}                            (//div[@class="card"])[3]
${paypalClientIdInput}                  //*[@id="PAYPAL_SANDBOX_CLIENT_ID"]
${paypalClientSecretInput}              //*[@id="PAYPAL_SANDBOX_CLIENT_SECRET"]
${paypalStatusChkBox}                   //label[@for='paypalSelected']
${paypalActiveClass}                    //div[@class="shipping-provider" and contains (., "Paypal settings")]//span[@class="status active"]
${paypalInactiveClass}                  //div[@class="shipping-provider" and contains (., "Paypal settings")]//span[@class="status inactive"]
${paypalIsActive}                       //input[@id="paypalSelected" and @checked]

${SelectConfigurationProfile}           //a[@href="/configuration" and @class="text-left dropdown-item"]

${StripePublicKEy_ErrorMsg}            //div[@class="text-danger small" and text()='"cfg.STRIPE_KEY" is not allowed to be empty']
${StripePrivateKEy_ErrorMsg}           //div[@class="text-danger small" and text()='"cfg.STRIPE_SECRET" is not allowed to be empty']

${squareAppId_ErrorMsg}                //div[@class="text-danger small" and text()='"cfg.SQUARE_APPLICATION_ID" is not allowed to be empty']
${squareToken_ErrorMsg}                //div[@class="text-danger small" and text()='"cfg.SQUARE_TOKEN" is not allowed to be empty']
${squareLocation_ErrorMsg}             //div[@class="text-danger small" and text()='"cfg.SQUARE_LOCATION" is not allowed to be empty']

${paypalClientID_ErrorMsg}             //div[@class="text-danger small" and text()='"cfg.PAYPAL_SANDBOX_CLIENT_ID" is not allowed to be empty']
${paypalClientSecret_ErrorMsg}         //div[@class="text-danger small" and text()='"cfg.PAYPAL_SANDBOX_CLIENT_SECRET" is not allowed to be empty']







