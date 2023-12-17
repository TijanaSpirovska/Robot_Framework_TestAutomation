*** Variables ***
${discountsSideBarBtn}                  //a[@class="nav-link promotions-icon" and @href="/promotions/discounts"]
${giftCSideBarBtn}                      //a[@href="/promotions/gift-cards"]
${profilePicBtn}                        //button[@class="dropdown-toggle btn btn-primary"]
${configurationLink}                    //a[@title="Configuration" and @href="/configuration"]
${configurationUrlPath}                 https://iwcuat-admin.iwcommerce.com/configuration
${logoutLink}                           //a[@title="Logout" and contains (., "Logout")]
${tableSpinner}                         //*[@class="spinner-border text-primary"]
${confirmationModal}                    //*[@class="modal-content"]
${confirmBtn}                           //button[@class="btn btn-primary" and contains (.,"Confirm")]
${cancellBtn}                           //button[@type="button" and contains (., "Cancel")]
${tabIsDisplayed}                       //div[@class="collapse show"]

${filterBtn}                            //button[@class="btn btn-primary" and contains (.,"Filter")]
${singleFilter_field}                   //div[@class="switch-item active" and contains(.,"Single")]
${singleFilter_NameField}               //div[contains(@class, "css-13t1v1n")]
${singleFilterInputField}               //input[contains(@placeholder,"Name")]
${switchToSingleFilter}                 //div[@class="switch-item" and contains (., "Single")]
${advanced_Filter}                      //div[@class="switch-item" and contains (., "Advanced")]
${disabledDeleteBtn}                    //*[@class="flex items-center delete disabled"]

${table}                                //table[@class="table table-hover"]
${tableHeadRow}                         (//thead//descendant::tr)
${tableRow}                             (//tbody//descendant::tr)
${tableData}                            //descendant::td
${firstTD}                              //descendant::td[1]
${editBtn}                              //span[@class="ml-1" and contains(.,"Edit")]
${deleteBtn}                            //span[@class="ml-1" and contains(.,"Delete")]

${resetBtn}                             //button[@class="inverse mr-2 btn btn-primary" and contains (., "Reset")]
${createBtn}                            //button[@class="btn btn-primary" and contains (.,"Create")]
${updateBtn}                            //button[@class="btn btn-primary" and contains (., "Update")]

${updateProviderBtn1}                   (//button[@class="btn btn-primary" and contains (., "Update")])[1]
${updateProviderBtn2}                   (//button[@class="btn btn-primary" and contains (., "Update")])[2]
${updateProviderBtn3}                   (//button[@class="btn btn-primary" and contains (., "Update")])[3]


${tableTHead}                           //th[@class="sort" and @data-name]
${data-name}                            data-name


# xpath elements for pagination testing. pagination is not complete yet from dev side, so implementation of tests for it must wait
${showingItems}                         //div[@class="showing-items"]
${itemsPerPage}                         //div[@class="items-per-page"]
${pageNavigation}                       //ul[@class="pagination justify-content-end"]
${pageItem}                             //li[@class="page-item"]
${pageLinkButton}                       //button[@class="page-link"]
${showingNumberOfRecordsSpan}           //span[@class="number"][1]
${totalNumberOfRecordsSpan}             //span[@class="number"][2]
${paginationListItems}                  //ul[@class="pagination justify-content-end"]//child::li
${paginationSingleListItem}             //li[contains(@class, "page-item")]

${Advanced_filter_name}                 //input[@id="name"]

${AvatarBtn}                            //button[contains(@class,"dropdown-toggle")]
${Configuration}                        //a[contains(@href,"/configuration") and contains(@class,"dropdown")]
