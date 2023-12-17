*** Variables ***
${TaxProvidersInConfiguration}              //div[@class="Configuration_content__Z5G-Y" and contains(.,"Tax providers")]
${taxProvidersUrl}                          https://iwcuat-admin.iwcommerce.com/configuration/tax-providers


${taxJarTab}                                (//div[@class="custom-card-header card-header"])[1]
${taxJarActive}                             //span[@class="status active"]
${taxJarInactive}                           //span[@class="status inactive"]
${taxJarAPITokenInput}                      //input[@name="TAXJAR_API_TOKEN"]
#${taxJarStatusChkBox}                      //input[@id="status"]//ancestor::div[@class="cb-nice undefined"]
${taxJarStatusCheckBox}                     //label[@class="cb-label form-label" and @for="status"]
${taxJarIsActive}                           //input[@id="status" and @checked]


${avalaraTab}                               (//div[@class="custom-card-header card-header"])[2]
${avalaraActiveClass}                       //div[@class="tax-provider" and contains (., "Avalara settings")]//span[@class="status active"]
${avalaraInactiveClass}                     //div[@class="tax-provider" and contains (., "Avalara settings")]//span[@class="status inactive"]
${avalaraUsernameInput}                     //input[@name="AVALARA_USERNAME"]
${avalaraPasswordInput}                     //input[@name="AVALARA_PASSWORD"]
${accountIdInput}                           //input[@name="AVALARA_ACCOUNT_ID"]
${companyIdInput}                           //input[@name="AVALARA_COMPANY_ID"]
${taxpayerIdNrInput}                        //input[@name="AVALARA_TAXPAYER_ID"]
${avalaraStatusChkBox}                      //input[@id="avalaraStatus"]
${avalaraIsActive}                          //input[@id="avalaraStatus" and @checked]


${vertexTab}                                (//div[@class="custom-card-header card-header"])[3]
${vertexActiveClass}                        //div[@class="tax-provider" and contains (., "Vertex settings")]//span[@class="status active"]
${vertexInactiveClass}                      //div[@class="tax-provider" and contains (., "Vertex settings")]//span[@class="status inactive"]
${vertexAPITokenInput}                      //input[@name="VERTEX_API_TOKEN"]
${vertexStatusChkBox}                       //input[@id="vertexStatus"]
${vertexIsActive}                           //input[@id="vertexStatus" and @checked]



















