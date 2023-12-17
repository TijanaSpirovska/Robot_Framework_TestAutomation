*** Variables ***

${Categories_link}                //a[@class="nav-link categories-icon"]                                #Categories link in tne left side-bar menu
${CategoriesTitle_text}           //span[@class="page-title" and contains(.,"Categories")]              #Categories title of the page
${ResetBtn_CategPage}             //button[@class="inverse mr-2 btn btn-primary"]                       #Reset button for filters on Categories page
${SingleFilter_field_CategPage}   //div[contains(@class, "css-13t1v1n")]                                #Single filter select field
${SingleFilter_by_CategPage}      //input[contains(@placeholder,"Slug")]                         #Single Filter by intput field on Categories page
${FilterBtn_CategPage}        //button[@class="btn btn-primary" and contains (.,"Filter")]          #Filter button on Categories page
${Single_filter_CategPage}         //div[@class="switch-item" active]                                   #Single filtering toggle button on Categories page
${Advanced_filter_CategPage}      //div[@class="switch-item" and contains(.,"Advanced")]                #Advanced filtering toggle button on Categories page
${InputName_CategPage}            //*[@id="name"]                                                       #Name input filter field in Advanced filters on Categories page
${InputSLug_CategPage}            //*[@id="slug"]                                                               #Slug input filter field in Advanced filters on Categories page
${AddCategoryBtn_CategPage}       //button[@class="btn btn-light" and contains (.,"+ Add Category")]    #+Add Category button on Categories page
${Name_sort_CategPage}            //th[@data-name="name"]                                               #Name column on Categories page on Categories page
${Slug_sort_CategPage}            //th[@data-name="slug"]                                               #Slug column on Categories page
${Description_sort_CategPage}     //th[@data-name="description"]                                        #Description column on Categories page
${ProductsCount_CategPage}        //th[@data-name="products_count"]                                     #Products column on Categories page
${DeleteCateg_button}             //span[@class="ml-1" and contains(.,"Delete")]                        #Category delete button
${ConfirmDeleteCateg_btn}         //button[contains (.,"Confirm")]                                     #Confirm Delete button for Category
${EditCateg_button}               (//span[@class="ml-1" and contains(.,"Edit")])[1]                     #Category edit button
${SingleFilter_byName_CategPage}      //input[contains(@placeholder,"Name")]
${ResetFilter}                    //button[@type="button" and contains(.,"Reset")]