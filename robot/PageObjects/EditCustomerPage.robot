*** Variables ***

${EditCustomerTitle_text}           //span[@class="page-title" and contains(.,"Edit")]              #Edit Category title of the page
${InputFirstName_EditCustom}        //input[@name="first_name"]                                     #Select Main Category field on vCateg page
${InputLastName_EditCustom}         //input[@name="last_name"]                             #Input Description field for Category on EditCateg page
${InputPhone_EditCustom}            //input[@name="phone"]                                       #Input Category Name for Category on EditCateg page
${InputEmail_EditCustomPage}        //input[@name="email"]                                           #Input Slug for Category on EditCateg page
${SelectCompany_EditCustom}         (//div[@class=" css-13t1v1n"and contains(.,"Select...")])[1]                                         #Upload an image button
${SelectAddressBilling_EditCustom}  //*[@id="address_type"and contains (.,"Billing address")]
${SelectAddressShipping_EditCustom}  //*[@id="address_type"and contains (.,"Shipping address")]
${BillingAddressDefault_Checkbox_EditCustom}        //input[@data-name="Billing address" and @id="is_default_0"]   #Billing address 'Set as default' checkbox, Edit Customer page
${ShippingAddressDefault_Checkbox_EditCustom}       //input[@data-name="Shipping address" and @id="is_default_1"]  #Shipping address 'Set as default' checkbox
${InputAddressName_Billing_EditCustom}        //input[@name="address_name_0"]                                #Input Address name, first defined address
${InputAddressName_Shipping_EditCustom}       //input[@name="address_name_1"]                                #Input Address name, second defined address
${InputAddressNumber_Billing_EditCustom}      //input[@name="address_number_0"]                              #Input Address number, first defined address
${InputAddressNumber_Shipping_EditCustom}     //input[@name="address_number_1"]                              #Input Address number, second defined address
${InputZipCode_Billing_EditCustom}            //input[@name="zip_code_0"]                                    #Input Zip code, first defined address
${InputZipCode_Shipping_EditCustom}           //input[@name="zip_code_1"]                                    #Input Zip code, second defined address
${InputCity_Billing_EditCustom}               //input[@name="city_0"]                                        #Input Address number, first defined address
${InputCity_Shipping_EditCustom}              //input[@name="city_1"]                                        #Input Address number, second defined address
${SelectCountry_Billing_EditCustom}           //*[@id="country_code_0"]                             #Select Billing Country field on CreateCust page
${SelectCountry_Shipping_EditCustom}          //*[@id="country_code_1"]                             #Select Country field on CreateCust page
${SelectState_Billing_EditCustom}             //*[@id="state_0"]                             #Select State first field on CreateCust page
${SelectState_Shipping_EditCustom}            //*[@id="state_1"]                              #Select State second field on CreateCust page
${AddNewAddress_btn}                        //button[@class="btn btn-light" and contains (.,"+ Add new")]  #+Add new address button in CreateCust page
${BillAddressRequired_error_msg}            //div[@class='text-danger small' and contains(text(),'"Address name" is not allowed to be empty')]     #This field is required / Billing address
${BillAddressNumRequired_error_msg}         //input[@name="address_number_0" and @class="border-error form-control"]    #This field is required / Billing address number
${BillAddressZipRequired_error_msg}         //input[@name="zip_code_0" and @class="border-error form-control"]          #This field is required / Billing address Zip
${BillAddressCityRequired_error_msg}        //div[@class='text-danger small' and contains(text(),'"City" is not allowed to be empty')]              #This field is required / Billing address City
${BillAddressCountryRequired_error_msg}     //div[@class="select-error css-dcp6eu-container"]                           #This field is required / Billing address Country
${ShipAddressRequired_errormsg}            //div[@class='text-danger small' and contains(text(),'"Address name" is not allowed to be empty')]      #This field is required / Shipping address
${ShipAddressNumRequired_error_msg}         //input[@name="address_number_1" and @class="border-error form-control"]    #This field is required / Shipping address number
${ShipAddressZipRequired_error_msg}         //input[@name="zip_code_1" and @class="border-error form-control"]          #This field is required / Shipping address Zip
${ShipAddressCityRequired_error_msg}        //input[@name="city_1" and @class="border-error form-control"]              #This field is required / Shipping address City
${ShipAddressCountryRequired_error_msg}     //div[@class="select-error css-dcp6eu-container"]                           #This field is required / Shipping address Country
${UpdateBtn_EditCustomPage}                 //button[@type="submit" and @class="btn btn-primary"]                       #Update button in Edit Customer page
${FirstNameRequired_EditCustom}             //input[@name="first_name" and @class="border-error form-control"]          #This field is required / First name
${ShippingAdressNumber}                     //*[@id="address_number_1"]
${BillingAdressNumber}                      //*[@id="address_number_0"]