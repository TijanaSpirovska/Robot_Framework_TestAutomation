*** Variables ***
# Companies Page elements
${companiesSideBarBtn}                  //a[@class="nav-link companies-icon"]
${filterName}                           Name
${filterVat}                            Vat
${advancedNameInput}                    //input[@id="name"]


# Create/Edit Company Page elements
${createCompanyLink}                    //a[@class="nav-link" and @href="/companies/create"]
${createCompanyForm}                    //div[@class="col-xl-12 box box-p"]
${createCompanyBtn}                     //button[@type="submit" and contains (., "+ Add Company")]
${nameInput}                            //input[@id="name"]
${vatInput}                             //input[@placeholder="Company vat"]
${ImageInput}                           //input[@type="file"]
${invalidCompanyDataDiv}                //div[@class="alert alert-danger p-2 mt-3"]
${CreateCompanyTitle_text}              //span[@class="page-title" and contains(.,"Create Company")]
${EditCompanyTitle_text}                //span[@class="page-title" and contains(.,"Edit Company")]
# Delete Company elements
${deleteRowBtn}                         (//span[@class="flex items-center delete" and contains(.,"Delete")])[1]
${CompanyName_errorMsg}                 //label[contains(.,"Company name")]//following::div[contains(@class,"text-danger")]
