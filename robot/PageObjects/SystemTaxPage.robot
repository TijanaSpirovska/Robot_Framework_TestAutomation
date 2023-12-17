*** Variables ***

${TaxProvidersSection}                  //a[@href="/configuration/tax-providers"]
${SystemTaxTab}                         //a[@href="/configuration/system-taxes" and contains (., "System taxes")]
${addTaxBtn}                            //*[@class="btn btn-light" and contains (., "+ Add Tax")]

${taxPageTitle}                         //*[@class="section-title" and contains (., "Taxes")]
${taxOverview}                          //*[@class="col-lg-12 box box-p"]
${advancedNameInput}                    //input[@id="name"]

${tableRow}                             (//tbody//descendant::tr)
${firstTD}                              //descendant::td[1]
#${tableRow}                             //tbody//descendant::tr

${editPageTitle}                        //*[@class="page-title" and contains(., "Edit System Tax")]


${filterName}                           name
${filterKey}                            key
${filterDescription}                    description

${CreateTaxPage_Title}                  //*[@class="page-title" and contains (., "Create System Tax")]
${taxNameInput}                         //input[@id="name"]
#${keyInput}                             //label[@class="form-label" and contains (., "Key")]//following-sibling::input
${keyInput}                             //input[@id="key"]
${descriptionInput}                     //textarea[@data-name="description"]
${taxCatName}                           //input[@id="name_0"]
${countryDropDown}                      (//div[@class="select__input"]//descendant::input)[1]
${stateInput}                           (//div[@class="select__input"]//descendant::input)[2]
${rateInput}                            //input[@id="rate_0"]
${deleteTaxCategBtn}                    //span[@class="ml-1"]
${AddNew_TaxCategory}                   //button[@type="button" and contains(.,"+ Add new")]

${Advanced_filter_key}                  //input[@name='key']
${Advanced_filter_desc}                 //input[@name="description"]
${SystemTax_MockText}                   VAT-test
${SystemTax_MockText2}                  VAT-test updated
