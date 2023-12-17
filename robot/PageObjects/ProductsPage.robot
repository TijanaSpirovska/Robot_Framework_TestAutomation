*** Variables ***

${Products_link}                 //a[@class="nav-link products-icon"]                               #Products link in tne left side-bar menu
${ProductsTitle_text}            //span[@class="page-title" and contains(.,"Products")]             #Product title of the page
${SelectFiter_ProdPage}          //*[@id="singleSelectedFilterStatus"]                              #Filter select field on Products page
${ResetBtn_ProdPage}             //button[@class="inverse mr-2 btn btn-primary"]                    #Reset button for filters field on Products page
${NameFilter_by_ProdPage}        //input[@placeholder="Filter by Name"]                             #Filter by Name field on Products page
${CategoriesFilter_by_ProdPage}  //input[@placeholder="Filter by Categories"]                      #Filter by Category field on Products page
${SlugFilter_by_ProdPage}        //input[@placeholder="Filter by Slug"]                            #Filter by Slug field on Products page
${StatusFilter_by_ProdPage}      //input[@placeholder="Filter by Status"]                            #Filter by Status field on Products page
${CreatedAt_Filter_by_ProdPage}  //input[@placeholder='mm/dd/yyyy']                                 #Filter by Created at field on Products page
${UpdatedAt_Filter_by_ProdPage}    //input[@placeholder='mm/dd/yyyy']                               #Filter by Updated at field on Products page
${Filter_button_ProdPage}        //button[@type='submit']                                           #Filter button on Products page
${Single_filter_ProdPage}        //div[@class="switch-item active" and contains (.,"Single")]       #Single filtering toggle button on Products page
${Advanced_filter_ProdPage}      //div[@class='switch-item' and text()='Advanced']                  #Advanced filtering toggle button on Products page
${InputName_ProdPage}            //input[@id='name']                                                #Name input filter field in Advanced filters on Products page
${InputCategories_ProdPage}      //input[@id="categories"]                                          #Categories input filter field in Advanced filters on Products page
${InputSlug_ProdPage}             //input[@id="slug"]                                               #Slug input filter field in Advanced filters on Products page
${SelectStatus_ProdPage}         //div[@class='select__value-container css-13t1v1n']                #Status filter selection field on Products page
${CreatedAt_dateInput_ProdPage}  //input[@placeholder='mm/dd/yyyy']                                 #Created At date filter input field on Products page
${CreatedAt_Options}             //div[@class='select__value-container select__value-container--has-value css-13t1v1n']
${MoreOptionsBtn_ProdPage}       //button[@class='px-4 dropdown-toggle btn btn-primary']            #+MORE OPTIONS button on Products page
${AddProductsbtn_ProdPage}       //button[@class="btn btn-light" and contains (.,"+ Add Product")]  #+ADD PRODUCT button on Products page
${NameColumn_sort_ProdPage}      //th[@data-name="name"]                                            #Name column on Products page
${CategoriesColumn_ProdPage}     //th[@data-name="name"]                                            #????Categories column on Products page
${ProductVariantsColumn_ProdPage}  //th[@data-name="variants_count"]                                #Product Variants column on Products page
${StatusColumn_ProdPage}          //th[@data-name="status"]                                         #Status column on Products page
${CreatedAtColumn_ProdPage}       //th[@data-name="created_at"]                                     #Created At column on Products page
${UpdatedAtColumn_ProdPage}       //th[@data-name="updated_at"]                                     #Updated At column on Products page
${BreadCrumb_Dashboard_ProdPage}  //a[@href="/dashboard" and contains(.,"Dashboard")]               #Breadcrumb on Products page
${DeleteProd_button}             //span[@class="ml-1" and contains(.,"Delete")]                     #Product delete button
${EditProductBtn_ProdPage}       //span[@class="ml-1" and contains(.,"Edit")]                       #Product edit button
${ConfirmDeleteProd_btn}         //button[@class="btn btn-primary" and contains (.,"Confirm")]      #Confirm Delete button for Categorry
${MasterVariantBtn_ProdPage}     //div[@class="master-variant" and contains(.,"M")]
${SelectFilter_Status}           //div[@id='singleSelectedFilter']
${SelectAll_ProdPage}              //div[@class='checkbox-nice']/input[@type='checkbox']             #Status filter selection field on Products page
${Filter_Advanced}                //div[@class='switch-item active' and text()='Advanced']
${Checkbox_select}                //div[@class='checkbox-nice']
${MoreOpt_ChangeStatusSelected}               //a[@class='text-right dropdown-item' and text()='Change status (selected)']
${NewProduct_Status}              //div[@class='Modal_title__16bY- modal-title h4' and text()='Set new products status']
${Select_Status}                  //div[@class="select__value-container css-13t1v1n"]
${Cancel_button}                  //button[@class='btn btn-light' and contains(text(),'Cancel')]
${Confirm_button}                 //button[@class="btn btn-primary" and text()="Confirm"]
${MoreOpt_ChangeStatusAll}               //a[@class='text-right dropdown-item' and text()='Change status (all found)']
${MoreOpt_ExportSelected}          //a[@class='text-right dropdown-item' and text()='Export (selected)']
${MoreOpt_ExportAll}               //a[@class='text-right dropdown-item' and text()='Export (all found)']
