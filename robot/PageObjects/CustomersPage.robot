*** Variables ***

${Customers_link}                //a[@class="nav-link customers-icon"]                                 #Customers link in tne left side-bar menu
${CustomersTitle_text}           //span[@class="page-title" and contains(.,"Customers")]               #Customers title of the page
${ResetBtn_CustPage}             //button[@class="inverse mr-2 btn btn-primary"]                       #Reset button for filters on Customers page
${SingleFilter_field_CustPage}   //div[@class='select__value-container select__value-container--has-value css-13t1v1n']                                          #Customers Single filter select field
${SingleFilter_by_CustPage}      //input[@id='n/a' and @type='text' and contains(@placeholder, 'First name')]                     #Single Filter by intput field on Customers page
${Filter_button_CustPage}        //button[@class="btn btn-primary" and contains (.,"Filter")]          #Filter button on Customers page
${Single_filter_CustPage}        //div[@class="switch-item active" and contains(.,"Single")]           #Single filtering toggle button on Customers page
${Advanced_filter_CustPage}      //div[@class="switch-item" and contains(.,"Advanced")]                #Advanced filtering toggle button on Customers page
${InputFirstName_CustPage}       //*[@id="first_name"]                                                 #First Name input filter field in Advanced filters on Customers page
${InputLastName_CustPage}        id:last_name                                                          #Last Name input filter field in Advanced filters on Customers page
${InputPhone_CustPage}           //*[@id="phone"]                                                      #Phone input filter field in Advanced filters on Customers page
${InputEmail_CustPage}           //*[@id="username"]                                                      #Email input filter field in Advanced filters on Customers page
${AddCustomerBtn_CustPage}       //button[@class="btn btn-light" and contains (.,"+ Add Customer")]    #+Add Customer button on Customers page
${Name_sort_CustPage}            //th[@data-name="first_name" and @class="sort"]                       #Name column on Customers page
${Email_sort_CustPage}           //th[@data-name="email" and @class="sort"]                            #Email column on Customers page
${Phone_sort_CustPage}           //th[@data-name="phone" and @class="sort"]                            #Phone column on Customers page
${Address_sort_CustPage}         ???????                                                               #Address column on Customers page
${EditCustom_button}             //a[@class="mr-2 edit" and @title="Edit item"]                        #Customers edit button
${DeleteCustom_button}           //span[@class="ml-1" and contains(.,"Delete")]                        #Customers delete button
${ConfirmDeleteCustom_btn}       //button[@class="btn btn-primary" and contains (.,"Confirm")]         #Confirm Delete button for Customers
${Advanced_filter_ProdPage}      //div[@class='switch-item' and text()='Advanced']
${Filter_Advanced}                //div[@class='switch-item active' and text()='Advanced']
${AdvancedFilter_Firstname}       //*[@id="first_name"]
${AdvancedFilter_Lastame}         //*[@id="last_name"]
${AdvancedFilter_Username}        //*[@id="username"]
${AdvancedFilter_CustomerEmail}   //*[@id="customer_email"]
${AdvancedFilter_Phone}           //*[@id="phone"]
${Select_checkbox}                (//div[@class='checkbox-nice'])[2]
${MoreOptionsBtn_ProdPage}        //button[@aria-haspopup='true' and @aria-expanded='false' and @class='px-4 dropdown-toggle btn btn-primary' and @style='padding: 0.85em 3em;']
${MoreOpt_ArchiveSelected}        //a[@class='text-right dropdown-item' and @role='button' and text()='Archive (selected)']
${MoreOpt_ArchiveAll}             //a[@class='text-right dropdown-item' and @role='button' and text()='Archive (all found)']
${Confirm_button}                 //button[@class="btn btn-primary" and text()="Confirm"]
${Cancel_button}                 //button[@class='btn btn-light' and contains(text(),'Cancel')]
${ArchivedCustomers_btn}          //label[@for="toggle-all-customers" and @class="pl-3 form-check-label"]
${MoreOpt_UnarchiveSelected}      //a[@class='text-right dropdown-item' and @role='button' and text()='Unarchive (selected)']
${MoreOpt_UnarchiveAll}           //a[@class='text-right dropdown-item' and @role='button' and text()='Unarchive (all found)']
${MoreOpt_ExportAll}             //a[@class='text-right dropdown-item' and text()='Export (all found)']
${MoreOpt_ExportSelected}        //a[@class='text-right dropdown-item' and text()='Export (selected)']
${Delete_Dialogue}                        //div[@class="modal-content"]
${CustTable}                           //div[@class="table-responsive"]
${DeleteCustomer}                         (//span[@class="ml-1" and contains(.,"Delete")])
${SingleFilter_FirstName}             //input[@placeholder='Filter by ... First name' and @type='text']
${SingleFilter_LastName}              //input[@placeholder='Filter by ... Last name' and @type='text']
${SingleFilter_Email}                //input[@placeholder='Filter by ... Customer email' and @type='text']
${SingleFilter_Username}             //input[@placeholder='Filter by ... Username' and @type='text']
${SingleFilter_Phone}                 //input[@placeholder='Filter by ... Phone' and @type='text']
${mock_test_country}                 United States of America