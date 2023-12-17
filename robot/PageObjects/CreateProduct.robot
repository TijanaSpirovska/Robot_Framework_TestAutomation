*** Variables ***

${InputProductName_CreateProdPage}       //*[@id="name-0-usa"]                                            #Input field for Product name on CreateProd page
${InputSlug_CreateProdPage}              //input[@class="form-control form-control-sm" and @name="slug"]  #Input field for Product slug on CreateProd page
${SelectType_CreateProdPage}             //*[@id="product_type"]                                #Select Product Type field on CreateProd page
${SelectTax_CreateProdPage}              //*[@id="product_tax"]              #Select Product Tax field on CreateProd page
${RestrictedCountries_CreateProd}        //div[@class='select__placeholder css-oefkzl-placeholder' and text()='Search for restricted countries']        #Select Restricted Countries field on CreateProd page
${DescriptionTextBox_CreateProdPage}     //div[@id="mceu_26"]/iframe         #Input Description field on CreateProd page
${InputDescription_CreateProdPage}       //*[@id="tinymce"]
${TextFormatOptions_CreateProdPage}      //*[@id="mceu_70"]                                               #Text Format options Description field on CreateProd page
${AddCategorieField_CreateProdPage}      (//input[@autocomplete="off"])[6]                               #Add categories field on CreateProd page
${AddAttributesField_CreateProdPage}     (//input[@autocomplete="off"])[7]                             #Add attributes field on CreateProd page
${CreateBtn_CreateProdPage}              //button[@type="submit"]                                         #'Create' button on CreateProd page
${MasterVariant_VariantsPage}            //span[@class="table-master"]
${VariantsTab_VariantsPage}              //a[@class="nav-link active d-block "]
${VariantsTab_ProductDataPage}           //a[@class='nav-link  d-block ']
${ProductDataTab}                        //a[@class="nav-link active d-block" and contains(.,"Product data")]
${MasterVariantSign}                     //span[@title="Master variant" and contains(.,"M")]
${VariantCountrSign}                     //span[@class="count" and contains (.,"1")]
${EditMasterVariant_VariantsPage}        //a[@class="mr-2 edit" and @title="Edit item"]
${CloneMasterVariant_VariantsPage}       //span[@class="ml-1" and contains (.,"Clone")]
${DeleteMasterVariant_VariantsPage}      //span[@class="ml-1" and contains (.,"Delete")]
${VariantDataTab_VariantsDataPage}       //a[@class='nav-link active d-block']
${VariantPhotosTab_VariantsDataPage}     //a[@class="nav-link " and contains(.,"Variant photos")]
${VariantPricesTab_VariantsDataPage}     //a[@class="nav-link " and contains(.,"Variant prices")]
${InputProductName_VariantDataPage}      //input[@id="name-0-usa"]
${IsMasterCheckbox}                      //input[@type="checkbox" and @id="is_master" ]
${InputCustomAttribute_VariantDataPage}  //input[@id='5']
${ProductVariantsTitle_text}             //span[@class="page-title" and contains(.,"Product Variants")]
${ProductsCrumb_link}                    //a[@class="crumb" and contains(.,"Products")]
${ProdNameRequired_error_msg}            //*[@id="content"]  #This field is required / Product name
${ProdSlugRequired_error_msg}            //div[@class='text-danger small'][contains(text(),'"Slug" is not allowed to be empty')]      #This field is required / Product slug
${InputFedexWeight_VariantDataPage}      //*[@id="weight"]
${InputFedexLength_VariantDataPage}      //*[@id="length"]
${InputFedexWidth_VariantDataPage}       //*[@id="width"]
${InputFedexHeight_VariantDataPage}      //*[@id="height"]
${SelectUnit_VariantDataPage}            //*[@id="units"]
${SelectDimensionsUnit_VariantDataPage}   (//div[@class=" css-13t1v1n"])[2]
${DescriptionTextBox_VariantProdPage}    //div[@class="mce-edit-area mce-container mce-panel mce-stack-layout-item mce-last"]/iframe
${InputDescription_VariantProdPage}      //*[@id="tinymce"]
${UpdateVariantDataBtn}                  //button[text()='Update']
${VarianPhotosTitle_text}                //span[@class="page-title" and contains(.,"Variant Photos")]
${VariantImageInput}                     //input[@type="file"]
${VariantPricesTitle_text}                //span[@class="page-title" and contains(.,"Variant Prices")]
${AddPriceBtn_VariantPricesPage}         //button[@class="btn btn-light" and contains (.,"+ Add Price")]
${SelectCurrency_VariantPricesPage}      //*[@id="currency_key"]
${InputPrice_VariantPricesPage}          //input[@placeholder='Price' and @type='number']
${SelectCountry_VariantPricesPage}       //*[@id="country_key"]
${ActiveFrom_VariantPricesPage}          (//input[@type='text'][@placeholder='mm/dd/yyyy'])[1]
${ActiveTo_VariantPricesPage}            (//input[@type='text'][@placeholder='mm/dd/yyyy'])[2]
${CreateBtn_VariantPricesPage}           //button[@type="submit" and contains(.,"Create")]
${EditVariantPrice}                      //span[@class="ml-1" and contains(.,"Edit")]
${DeleteVariantPrice}                    //span[@class="ml-1" and contains(.,"Delete")]
${EditClonedVariant_VariantsPage}         (//span[@class="ml-1" and contains(.,"Edit")])[2]
${Shippping_ProdPage}                    //*[@id="shipping_type_id"]
${menu_locator}                            //div[contains(@class, 'css-u69mdg-menu')]
${FlatRate_ProdShipping}                       //*[@placeholder="Flat rate amount" and @name="n/a"]
${ValueInput}                               //*[@id="n/a"]
${SelectValue}                          //div[@class='select__single-value css-1uccc91-singleValue' and text()='Input']
${AttributeName}                        //*[@id="custom_attributes_name_0-0-usa"]
${AddNewAttribute_Btn}                      //button[@type='submit' and @class='btn btn-light' and text()='+ Add new']

${Delete_Dialogue}                        //div[@class="modal-content"]
${CancelDelete_Btn}                       //button[@class="btn btn-light" and text()="Cancel"]
${TakenSlug_Msg}                         //li[text()="The slug has already been taken."]
${AddVarriant_Btn}                       //button[@type="submit" and @class="btn btn-light" and text()="+ Add Variant"]
${VariantsTab_Products}                  //div[@class="variants"]
${CreateBtn_NewVariant}                   //button[@type="submit" and contains(.,"Create")]
${NewProdVariant_Msg}              Successfully created product variant!
${NewVariant_ProdName}            //*[@id="name-0-usa"]
${Sku_ProdVariant}                //*[@id="sku"]
${Delete_NewProdVariant}          (//span[@class="ml-1" and contains(text(),"Delete")])[2]
${Delete_MsgProdVariant}          Successfully deleted product variant!
${Quantity_ProdVariant}          //input[@id='quantity']
${ErrorMsg_Multilang}            //small[@class="text-danger" and contains(text(),"All multi-lang inputs are required")]
${ErrorMsg_Sku}                  //div[@class="text-danger small" and contains(text(),'"Sku" is not allowed to be empty')]
${ErrorMsg_Quntity}              //div[@class="text-danger small" and contains(text(),'"Quantity" must be a number')]
${ErrorMsg_Value}                //div[@class="text-danger small" and contains(text(),'"Value" contains an invalid value')]
${ErrorMsg_Weight}               //div[@class="text-danger small" and contains(text(),'"Weight" is not allowed to be empty')]
${ErrorMsg_Length}               //div[@class="text-danger small" and contains(text(),'"Length" is not allowed to be empty')]
${ErrorMsg_Width}               //div[@class="text-danger small" and contains(text(),'"Width" is not allowed to be empty')]
${ErrorMsg_Height}               //div[@class="text-danger small" and contains(text(),'"Height" is not allowed to be empty')]
${RemovePhoto_PrdVariant}         (//div[@class="remove-photo ProductVariantPhoto_removePhoto__osKW-"])[1]
${RadioBtn_FeaturedPhoto}         (//label[@class="rb-label form-label"])[2]
${UploadPhoto_Msg}                 Successfully uploaded photo!
${DeletePhoto_Msg}                Successfully deleted photo!
${ErrorMsg_Currency}               //small[@class='text-danger'][contains(text(),'"Currency" is not allowed to be empty')]
${ErrorMsg_Country}                //small[@class='text-danger'][contains(text(),'"Country" is not allowed to be empty')]
${ErrorMsg_Price}                  //div[@class='text-danger small'][contains(text(),'"Price" must be greater than or equal to 0.01')]
${Image_Container}                 //div[@class='remove-photo ProductVariantPhoto_removePhoto__osKW-']