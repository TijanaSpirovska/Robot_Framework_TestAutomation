*** Variables ***

${vendorsLink}                  //a[@href="/configuration/vendors"]
${vendorsOverview}              //*[@class="col-lg-12 box box-p"]
${addVendorBtn}                 //*[@class="btn btn-light" and contains (., "+ Add vendor")]
${tableRow}                     //tbody//descendant::tr
${vendorPageTitle}              //*[@class="section-title" and contains (., "Vendors")]
${editBtn}                      (//span[@class="ml-1" and contains(.,"Edit")])

# Create Vendor Page elements
${vendorOwner}                  //input[@name="tenant_owner"]
${vendorName}                   //input[@name="tenant_original_name"]
${vendorSchema}                 //input[@name="tenant"]
${contactPerson}                //input[@name="contact_person"]
${phone}                        //input[@name="phone"]
${email}                        //input[@name="email"]
${website}                      //input[@name="website"]
${gl_account}                   //input[@name="gl_account"]
${category}                     //input[@name="category"]
${description}                  //textarea[@name="description"]
${addVendorAddress}             //button[@class="btn btn-light" and contains (., "+ Add new")]

# Address elements
${addressType}                  //input[@name="address_type_0"]
${addressName}                  //input[@name="address_name_0"]
${isDefault}                    //input[@name="is_default_0"]
${addressNumber}                //input[@name="address_number_0"]
${zipCode}                      //input[@name="zip_code_0"]
${city}                         //input[@name="city_0"]
${countryDropdown}              (//input[@type="text" and @spellcheck="false"])[2]
${state}                        (//input[@type="text" and @spellcheck="false"])[3]
${disabledState}                (//input[@type="text" and @spellcheck="false" and @disabled])

