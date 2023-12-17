*** Variables ***

${CreateCustomerTitle_text}              //span[@class="page-title" and contains(.,"Create Customer")]  #Create Customer title of the page
${InputFirstName_CreateCustomPage}       //input[@name="first_name"]                                    #Input First name for Customer on CreateCust page
${InputLastName_CreateCustomPage}        //input[@name="last_name"]                                     #Input Last name for Customer on CreateCust page
${InputPhone_CreateCustomPage}           //input[@name="phone"]                                         #Input Phone for Category on CreateCust page
${Company_CreateCustomPage}              (//div[@class=" css-13t1v1n"])[1]                              #Select Company field on CreateCust page
${InputUsername_CreateCustomPage}        //input[@id='email']                                     #Input Username for Customer on CreateCust page
${SelectAddressType_BillingField}        //div[contains(@class, 'select__value-container') and descendant::div[contains(@class, 'select__single-value') and text()='Billing address']]   #Select address type on CreateCust page
${SelectAddressType_ShippingField}       //div[contains(@class, 'select__value-container') and descendant::div[contains(@class, 'select__single-value') and text()='Shipping address']]  #Select address type on CreateCust page
${BillingAddressDefault_Checkbox}        //input[@data-name="Billing address" and @id="is_default_0"]   #Billing address 'Set as default' checkbox
${ShippingAddressDefault_Checkbox}       //input[@data-name="Shipping address" and @id="is_default_1"]  #Shipping address 'Set as default' checkbox
${InputAddressName_Billing_field}        //input[@name="address_name_0"]                                #Input Address name, first defined address
${InputAddressName_Shipping_field}       //input[@name="address_name_1"]                                #Input Address name, second defined address
${InputAddressNumber_Billing_field}      //input[@name="address_number_0"]                              #Input Address number, first defined address
${InputAddressNumber_Shipping_field}     //input[@name="address_number_1"]                              #Input Address number, second defined address
${InputZipCode_Billing_field}            //input[@name="zip_code_0"]                                    #Input Zip code, first defined address
${InputZipCode_Shipping_field}           //input[@name="zip_code_1"]                                    #Input Zip code, second defined address
${InputCity_Billing_field}               //input[@name="city_0"]                                        #Input Address number, first defined address
${InputCity_Shipping_field}              //input[@name="city_1"]                                        #Input Address number, second defined address
${SelectCountry_Billing_field}           //*[@id="country_code_0"]                              #Select Billing Country field on CreateCust page
${SelectCountry_Shipping_field}          //*[@id="country_code_1"]                             #Select Country field on CreateCust page
${SelectState_Billing_field}             //*[@id="state_0"]                             #Select State first field on CreateCust page
${SelectState_Shipping_field}            //*[@id="state_1"]                              #Select State second field on CreateCust page
${CreateBtn_CreateCustomPage}            //button[@type="submit" and contains(.,"Create")]              #'Create' button on CreateCust page
${AddNewAddress_btn}                     //button[@class="btn btn-light" and contains (.,"+ Add new")]  #+Add new address button in CreateCust page
${AddressRequired_error_msg}         //div[contains(@class, 'text-danger') and contains(@class, 'small') and contains(text(), '"Address name" is not allowed to be empty')]      #This field is required / Billing address
${AddressNumRequired_error_msg}      //div[contains(@class, 'text-danger') and contains(@class, 'small') and contains(text(), '"Address number" is not allowed to be empty')]   #This field is required / Billing address number
${AddressZipRequired_error_msg}      //div[contains(@class, 'text-danger') and contains(@class, 'small') and contains(text(), '"Zip code" is not allowed to be empty')]         #This field is required / Billing address Zip
${AddressCityRequired_error_msg}     //div[contains(@class, 'text-danger') and contains(@class, 'small') and contains(text(), '"City" is not allowed to be empty')]             #This field is required / Billing address City
${AddressCountryRequired_error_msg}  //small[contains(@class, 'text-danger') and contains(text(), '"Country" must be a string')]                           #This field is required / Billing address Country
${ShipAddressRequired_error_msg}         //input[@name="address_name_1" and @class="border-error form-control"]      #This field is required / Shipping address
${ShipAddressNumRequired_error_msg}      //input[@name="address_number_1" and @class="border-error form-control"]    #This field is required / Shipping address number
${ShipAddressZipRequired_error_msg}      //input[@name="zip_code_1" and @class="border-error form-control"]          #This field is required / Shipping address Zip
${ShipAddressCityRequired_error_msg}     //div[@class='text-danger small' and contains(text(),'"City" is not allowed to be empty')]              #This field is required / Shipping address City
${ShipAddressCountryRequired_error_msg}  //div[@class="select-error css-dcp6eu-container"]                           #This field is required / Shipping address Country
${CustomerEmail_warning}                 //li[@class='small' and text()='The email has already been taken.']
${Customer_WrongEmail}                   //div[@class='text-danger small' and contains(text(),'"email" must be a valid email')]
${DeleteBtn_CustAtt}                      (//span[@class="ml-1" and contains(.,"Delete")])
${CancelDelete_Btn}                        //button[@class="btn btn-light" and text()="Cancel"]
${ConfirmDelete_Btn}                      //button[@class="btn btn-primary" and contains(.,"Confirm")]
${FirstName_ErrorMsg}                    //div[@class='text-danger small' and contains(text(),'"first_name" contains an invalid value')]
${LastName_ErrorMsg}                     //div[@class='text-danger small' and contains(text(),'"last_name" contains an invalid value')]
