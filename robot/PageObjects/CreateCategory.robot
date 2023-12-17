*** Variables ***

${CreateCategoryTitle_text}          //span[@class="page-title" and contains(.,"Create Category")]   #Create Category title of the page
${SelectMainCateg_CreateCategPage}   (//input[@autocomplete="off"])[2]                                   #Select Main Category field on CreateCateg page
${DescriptionTextBox_CreateCategPage}    //div[@id="mceu_26"]/iframe                                 #Input Description field on CreateCateg page
${InputDescription_CreateCategPage}  //*[@id="tinymce"]                                              #Input Description field for Category on CreateCateg page
${InputCategName_CreateCategPage}    //input[@id="name-0-usa"]                                       #Input Category Name for Category on CreateCateg page
${InputSlug_CreateCategPage}         //input[@name="slug"]                                           #Input Slug for Category on CreateCateg page
${CreateBtn_CreateCategPage}         //button[@type="submit" and contains(.,"Create")]               #'Create' button on CreateCateg page
${CategImage_CreateCategPage}        //*[@id="category-image"]                                       #Category Image button on CreateCateg page
${CategNameRequired_error_msg}       //label[contains(.,"Category Name")]//following::div[contains(@class,"border-danger")]      #This field is required / Category name
${CategDescRequired_error_msg}       //label[contains(.,"Category Description")]//following::div[contains(@class,"border-danger")]        #This field is required / Category description
${CategSlugRequired_error_msg}       //label[contains(.,"Category slug")]//following::input[@id="slug"]                                                       #This field is required / Category slug
${CategImageInput}                   //input[@type="file"]                                                            #Upload an image button