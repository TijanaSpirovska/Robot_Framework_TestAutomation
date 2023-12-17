*** Settings ***
Library           SeleniumLibrary
Library           String

Resource          ../PageObjects/ProductsPage.robot
Resource          ../PageObjects/CreateProduct.robot
Resource          ../Resources/Testdata.robot
Resource          ProductsPage.robot

*** Keywords ***
Add a Product
    Click button                                             ${AddProductsbtn_ProdPage}
    Wait until page contains element                         ${CreateBtn_CreateProdPage}

Add values to the required Product fields
    Input text      ${InputProductName_CreateProdPage}       ${Product_Name}
    Click element   ${SelectType_CreateProdPage}
    Press Keys      ${SelectType_CreateProdPage}             ${General_ProdctType}       RETURN
    Click element   ${SelectTax_CreateProdPage}
    Press Keys      ${SelectTax_CreateProdPage}              ${VAT_TaxType}              RETURN
    select frame    ${DescriptionTextBox_CreateProdPage}
    input text      ${InputDescription_CreateProdPage}       ${test_description}
    unselect frame
    Click element    ${Shippping_ProdPage}
    Press keys       ${Shippping_ProdPage}                    ${Shipping_data1}          RETURN
    Click Element    ${FlatRate_ProdShipping}
    Press Keys       ${FlatRate_ProdShipping}                ${FlateRate_Amount}       RETURN
    Click element    ${RestrictedCountries_CreateProd}
    Press Keys      ${RestrictedCountries_CreateProd}        ${test_Country}    RETURN
    Input Text                      ${AddCategorieField_CreateProdPage}     ${filter_category_data}
    sleep          3
    Press Keys      ${AddCategorieField_CreateProdPage}                RETURN
    sleep     2

Add values to non-mandatory Product fields
    Input Text       ${AddAttributesField_CreateProdPage}     ${ProductAttribute}
    sleep         3
    Press keys      ${AddAttributesField_CreateProdPage}       RETURN
    sleep         2
Delete data from mandatory Product field
    Click Element                                            ${InputProductName_CreateProdPage}
    Press Keys    ${InputProductName_CreateProdPage}      CTRL+A+DELETE

Complete the product creation
    Click Element               ${CreateBtn_CreateProdPage}
    sleep        2
Add product variant
    Click Element     ${AddVarriant_Btn}

Verify Master variant is created
#    Wait until page contains                                  Successfully created product!
    wait until page contains element                          ${VariantsTab_VariantsPage}
    wait until page contains element                          ${MasterVariant_VariantsPage}
    page should contain element                               ${EditMasterVariant_VariantsPage}
    page should contain element                               ${CloneMasterVariant_VariantsPage}
    page should contain element                               ${DeleteMasterVariant_VariantsPage}

Verify product can not be created
    page should contain element                               ${ProdNameRequired_error_msg}
    Page Should Contain Element                               ${ProdSlugRequired_error_msg}
    location should be                                        ${CreateProductUrlPath}

Navigate and verify Variants page
    wait until page contains element                          ${VariantCountrSign}
    click element                                             ${VariantCountrSign}
    wait until page contains element                          ${ProductVariantsTitle_text}
    wait until page contains element                          ${MasterVariantSign}
    page should contain element                               ${EditMasterVariant_VariantsPage}
    page should contain element                               ${CloneMasterVariant_VariantsPage}
    page should contain element                               ${DeleteMasterVariant_VariantsPage}

Clone and Verify Cloned variant is created
    click element                                             ${CloneMasterVariant_VariantsPage}
#    wait until page contains                                  -CLONE
    sleep      3
    page should contain element                                ${EditClonedVariant_VariantsPage}

Access the Product Master variant
    wait until page contains element                          ${MasterVariantBtn_ProdPage}
    sleep    2
    click element                                             ${MasterVariantBtn_ProdPage}
    wait until page contains element                          ${VariantDataTab_VariantsDataPage}
    wait until page contains element                          ${VariantPhotosTab_VariantsDataPage}
    wait until page contains element                          ${VariantPricesTab_VariantsDataPage}
    wait until page contains element                          ${InputProductName_VariantDataPage}
#    textfield should contain                                  ${InputProductName_VariantDataPage}  ${Product_Name}

Add necessary details for Master Variant data
    [Arguments]    ${arg1}
#    checkbox should be selected                               ${IsMasterCheckbox}
    wait until page contains element                          ${DescriptionTextBox_VariantProdPage}
    select frame                                              ${DescriptionTextBox_VariantProdPage}
    sleep      2
    input text      ${InputDescription_VariantProdPage}       ${arg1}
    unselect frame
    Click Element    ${AddNewAttribute_Btn}
    Click Element    ${AttributeName}
    Input Text       ${AttributeName}                      ${NewAttribute}
    Click Element    ${SelectValue}
    Press Keys       ${SelectValue}                        Percentage  RETURN
    Click Element    ${ValueInput}
    Input Text       ${ValueInput}                 ${ValuePercentage}
    click element   ${InputCustomAttribute_VariantDataPage}
    input text      ${InputCustomAttribute_VariantDataPage}   navy
    click element   ${InputFedexWeight_VariantDataPage}
    input text      ${InputFedexWeight_VariantDataPage}       ${FedexWeight_data}
    Click element   ${SelectUnit_VariantDataPage}
    Press Keys      ${SelectUnit_VariantDataPage}             KG   RETURN
    click element   ${InputFedexLength_VariantDataPage}
    input text      ${InputFedexLength_VariantDataPage}       ${FedexLength_data}
#    Click element   ${SelectDimensionsUnit_VariantDataPage}
#    Press Keys      ${SelectDimensionsUnit_VariantDataPage}   CM   RETURN
    click element   ${InputFedexWidth_VariantDataPage}
    input text      ${InputFedexWidth_VariantDataPage}        ${FedexWidth_data}
    click element   ${InputFedexHeight_VariantDataPage}
    input text      ${InputFedexHeight_VariantDataPage}       ${FedexHeight_data}

Update and verify variant data is added
    click button    ${UpdateVariantDataBtn}
    wait until page contains element                          ${VarianPhotosTitle_text}
Create and verify a new variant data is added
    Click Button    ${CreateBtn_VariantPricesPage}
    sleep          2
    Wait Until Page Contains      ${NewProdVariant_Msg}
    Wait Until Page Contains      ${Updated}
Delete new product variant
    Click Element    ${Delete_NewProdVariant}
    sleep  2
    Page Should Contain Element     ${Delete_Dialogue}
    Click Element    ${Confirm_button}
    Wait Until Page Contains       ${Delete_MsgProdVariant}
    Page Should Not Contain    ${Updated}
Navigate and verify Variant photos tab page
    click element    ${VariantPhotosTab_VariantsDataPage}
    wait until page contains element                          ${VarianPhotosTitle_text}
    wait until page contains                                  ${Product_Name}
    page should contain element                               ${VariantImageInput}

Navigate and verify Variant prices tab page
    wait until page contains element                          ${VariantPricesTab_VariantsDataPage}
    click element                                             ${VariantPricesTab_VariantsDataPage}
    wait until page contains element                          ${VariantPricesTitle_text}
    wait until page contains                                  ${Product_Name}
    page should contain element                               ${AddPriceBtn_VariantPricesPage}

Upload and verify Variant photo
    Choose file     ${VariantImageInput}                      ${ImageExample1}
    sleep           5
    wait until page contains element                          ${OriginalPhotoValidation}
    Choose file     ${VariantImageInput}                      ${ImageExample2}
    sleep           5
    Click Element        ${RadioBtn_FeaturedPhoto}
Add empty Price and verify is not created
    click button                                              ${AddPriceBtn_VariantPricesPage}
    wait until page contains                                  Create product variant price
    wait until page contains element                          ${SelectCurrency_VariantPricesPage}
    wait until page contains element                          ${InputPrice_VariantPricesPage}
    wait until page contains element                          ${SelectCountry_VariantPricesPage}
    wait until page contains element                          ${ActiveFrom_VariantPricesPage}
    wait until page contains element                          ${ActiveTo_VariantPricesPage}
    click button                                              ${CreateBtn_VariantPricesPage}
    Wait Until Element Is Visible                             ${ErrorMsg_Currency}
    Wait Until Element Is Visible                             ${ErrorMsg_Price}
    Wait Until Element Is Visible                             ${ErrorMsg_Country}
Add and verify new variant prices
    click button                                              ${AddPriceBtn_VariantPricesPage}
    wait until page contains                                  Create product variant price
    wait until page contains element                          ${SelectCurrency_VariantPricesPage}
    wait until page contains element                          ${InputPrice_VariantPricesPage}
    wait until page contains element                          ${SelectCountry_VariantPricesPage}
    wait until page contains element                          ${ActiveFrom_VariantPricesPage}
    wait until page contains element                          ${ActiveTo_VariantPricesPage}

    click element                                             ${SelectCurrency_VariantPricesPage}
    press keys                                                ${SelectCurrency_VariantPricesPage}      ${Dollar_Currency}    RETURN
    wait until page contains                                  ${Dollar_Currency}
    input text                                                ${InputPrice_VariantPricesPage}          ${Price_ProdVarriant}
    wait until page contains                                  ${Price_ProdVarriant}
    click element                                             ${SelectCountry_VariantPricesPage}
    press keys                                                ${SelectCountry_VariantPricesPage}       ${test_Country}     RETURN
    wait until page contains                                  ${test_Country}
    input text                                                ${ActiveFrom_VariantPricesPage}          ${ActiveFrom_date}
    input text                                                ${ActiveTo_VariantPricesPage}            ${ActiveTo_date}
    click button                                              ${CreateBtn_VariantPricesPage}
    sleep           5
    wait until page contains element                          ${EditVariantPrice}
    wait until page contains element                          ${DeleteVariantPrice}

Verify product is successfully created
    Click button    ${Advanced_filter_ProdPage}
    Input text      ${Advanced_filter_ProdPage}                ${Product_Name}
    Click button    ${Filter_button_ProdPage}
    Wait until page contains                                   ${Product_Name}

Verify product with missing mandatory fields is not created
    wait until page contains element                           ${ProdNameRequired_error_msg}
    page should contain element                                ${ProdSlugRequired_error_msg}

Delete new product(clenup data)
    Click element    ${DeleteProd_button}
    Click button     ${ConfirmDeleteProd_btn}

Verify product data is sccessfully cleaned
    Input text       ${InputName_ProdPage}                    ${Product_Name}
    Click button     ${Filter_button_ProdPage}
    Wait until page does not contain                          ${Product_Name}

Test product cleanup data - Cancel Button
    Click link       ${Products_link}
    wait until location is                                    https://iwcuat-admin.iwcommerce.com/products
    wait until page contains element                          ${ProductsTitle_text}
    Filter Product by Name
    wait until page contains                                  ${Product_Name}
    click element    ${DeleteProd_button}
    Page Should Contain Element        ${Delete_Dialogue}
    click button     ${CancelDelete_Btn}
    Wait Until Page Contains            ${Product_Name}
Test product cleanup data - Confirm Button
    Click link       ${Products_link}
    wait until location is                                    https://iwcuat-admin.iwcommerce.com/products
    wait until page contains element                          ${ProductsTitle_text}
    Filter Product by Name
    wait until page contains                                  ${Product_Name}
    click element    ${DeleteProd_button}
    Page Should Contain Element      ${Delete_Dialogue}
    sleep                2
    click button     ${Confirm_button}
    sleep            3
    Page Should Contain                                  ${DeletedProduct_Msg}
    Wait Until Page Contains                                        ${No_Data}
Verify product can not be created with existing slug
    Page Should Contain Element    ${TakenSlug_Msg}
    sleep                   2
Add new varriant
    sleep               2
    Click Element    ${VariantsTab_Products}
    sleep     2
    Click Element    ${AddVarriant_Btn}
    Sleep    3
    Click Element    ${NewVariant_ProdName}
    Input Text       ${NewVariant_ProdName}        ${Updated}
    Click Element    ${Sku_ProdVariant}
    Input Text       ${Sku_ProdVariant}           256398

Remove necessary details for Master variant data
    Click Element    ${NewVariant_ProdName}
    Press Keys       ${NewVariant_ProdName}   CTRL+A+DELETE
    Click Element    ${Sku_ProdVariant}
    Press Keys       ${Sku_ProdVariant}   CTRL+A+DELETE
    Click Element    ${Quantity_ProdVariant}
    Press Keys       ${Quantity_ProdVariant}   CTRL+A+DELETE
    Click Element    ${InputCustomAttribute_VariantDataPage}
    Press Keys       ${InputCustomAttribute_VariantDataPage}   CTRL+A+DELETE
    Click Element    ${InputFedexWeight_VariantDataPage}
    Press Keys       ${InputFedexWeight_VariantDataPage}   CTRL+A+DELETE
    Click Element    ${InputFedexLength_VariantDataPage}
    Press Keys       ${InputFedexLength_VariantDataPage}   CTRL+A+DELETE
    Click Element    ${InputFedexWidth_VariantDataPage}
    Press Keys       ${InputFedexWidth_VariantDataPage}   CTRL+A+DELETE
    Click Element    ${InputFedexHeight_VariantDataPage}
    Press Keys       ${InputFedexHeight_VariantDataPage}   CTRL+A+DELETE
    select frame     ${DescriptionTextBox_VariantProdPage}
    sleep      2
    Press Keys       ${InputDescription_VariantProdPage}     CTRL+A+DELETE
    unselect frame
Update the variant data and confirm that it has not been added
    click button    ${UpdateVariantDataBtn}
    Page Should Contain Element        ${ErrorMsg_Multilang}
    Page Should Contain Element        ${ErrorMsg_Sku}
    Page Should Contain Element        ${ErrorMsg_Quntity}
    Page Should Contain Element        ${ErrorMsg_Value}
    Page Should Contain Element        ${ErrorMsg_Height}
    Page Should Contain Element        ${ErrorMsg_Length}
    Page Should Contain Element        ${ErrorMsg_Weight}
    Page Should Contain Element        ${ErrorMsg_Width}
Remove photo from Product Variant photos
    Wait Until Page Contains Element        ${Image_Container}
    mouse over                              ${Image_Container}
    Wait Until Element Is Visible           ${RemovePhoto_PrdVariant}
    Click Element                           ${RemovePhoto_PrdVariant}
    sleep                                   2
    Page Should Contain                     ${DeletePhoto_Msg}