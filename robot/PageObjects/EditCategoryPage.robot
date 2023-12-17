*** Variables ***

${EditCategoryTitle_text}          //span[@class="page-title" and contains(.,"Edit")]              #Edit Category title of the page
${SelectMainCateg_EditCategPage}   //div[@class=" css-ddqwys-control"]                             #Select Main Category field on vCateg page
${InputDescription_EditCategPage}  //div[@id="mceu_26"]/iframe                                              #Input Description field for Category on EditCateg page
${InputDescription_CreateCategPage}  //*[@id="tinymce"]
${InputCategName_EditCategPage}    //input[@id="name-0-usa"]                                       #Input Category Name for Category on EditCateg page
${InputSlug_EditCategPage}         //input[@name="slug"]                                           #Input Slug for Category on EditCateg page
${CategImageInput}                 //*[@id="file"]                                          #Upload an image button
${UpdateBtn_EditCategPage}         //button[@type="submit" and @class="btn btn-primary"]           #Update button in Edit Category page
${InvalidDataAlert_EditCategPage}  //div[@class="alert alert-danger p-2 mt-3"]                     #RFed alert message at the bottom of the Edit page, indicates that Category can not be edited
${ImageUploaded}                   //canvas[@id="file"]
${CategoryVisible}                 //label[@for="visible"]
${CategoryOrder}                   //input[@id="order"]