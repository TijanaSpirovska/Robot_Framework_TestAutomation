*** Settings ***
Library           SeleniumLibrary
Library           String

Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/ProductDataCRUD.robot
Resource          ../PageObjects/UsersPage.robot
Resource          ../PageObjects/MainPage.robot


*** Keywords ***
Navigate to Product Data page
    wait until location is               ${DashboardPage_URL}
    click element                        ${UserProfileBtn}
    click element                        ${SelectConfigurationProfile}
    wait until location is               ${ConfigurationPage_URL}
    wait until page contains element     ${ProdDataInConfirguration}
    click element                        ${ProdDataInConfirguration}
Verify Product Data page
    wait until location is               ${ProdTypesPage_URL}
    wait until page contains element     ${ProdDataPage_Title}
    wait until page contains element     ${producttypesetup_section}
    wait until page contains element     ${Table}
    wait until page contains element     ${tableRow}
Fill in mandatory data for a new Product Type
    [Arguments]     ${arg1}
    page should contain element          ${AddType_Input}
    input text                           ${AddType_Input}           ${arg1}
Create a new Product Type
    page should contain button           ${AddNew_Btn}
    click button                         ${AddNew_Btn}
Verify New Product Type is created
    [Arguments]     ${arg1}
    location should be                   ${ProdTypesPage_URL}
    wait until page contains             ${SuccesfulUpdateConfig_Msg}
    element should contain               ${Table}                           ${arg1}
Verify New Product Type is not created
    location should be                   ${ProdTypesPage_URL}
    page should contain element          ${BorderElementType_Error}
Delete Product type
#    ${Count}      Get Element Count      ${tableRow}
#    ${DeleteNewProductType}   Catenate   SEPARATOR=	 ${Delete_Btn}  [    ${Count}    ]
    Click Element        ${Delete_Btn}
    Wait Until Page Contains Element    ${Delete_Dialogue}
    Click Button                        ${ConfirmDelete_Btn}
Verify New Product Type is deleted
    [Arguments]     ${arg1}
    location should be                   ${ProdTypesPage_URL}
    wait until page contains             ${SuccesfulUpdateConfig_Msg}
    element should not contain           ${table}                           ${arg1}
Navigate and verify Product Prices section
    click element                        ${ProductPrices_Tab}
    wait until location is               ${prodpricespage_url}
    wait until page contains element     ${ProductPriceSetup_Section}
    wait until page contains element     ${addprice_label}
    page should contain element          ${AddPrice_Input}
    page should contain element          ${AddNew_Btn}
Fill in mandatory data for a new Product Price
    [Arguments]     ${arg1}
    page should contain element          ${AddPrice_Input}
    input text                           ${AddPrice_Input}          ${arg1}
Create a new Product Price
    page should contain button           ${AddNew_Btn}
    click button                         ${AddNew_Btn}
Verify New Product Price is created
    [Arguments]     ${arg1}
    location should be                   ${ProdPricesPage_URL}
    wait until page contains             ${SuccesfulUpdateConfig_Msg}
    element should contain               ${Table}                           ${arg1}
Verify New Product Price is not created
    location should be                   ${ProdPricesPage_URL}
    page should contain element          ${BorderElementPrice_Error}
Delete Product Price
    ${Count}      Get Element Count      ${tableRow}
    ${DeleteNewProductPrice}   Catenate   SEPARATOR=	 ${Delete_Btn}  [    ${Count}    ]
    sleep                               2
    click element    ${DeleteNewProductPrice}
    Wait Until Page Contains Element    ${Delete_Dialogue}
    Click Button                        ${ConfirmDelete_Btn}
Verify New Product Price is deleted
    [Arguments]     ${arg1}
    location should be                   ${ProdPricesPage_URL}
    wait until page contains             ${SuccesfulUpdateConfig_Msg}
    element should not contain           ${table}                           ${arg1}
Navigate and verify Product Attributes section
    click element                        ${ProductAttributes_Tab}
    wait until location is               ${ProdAttPage_URL}
    page should contain element          ${ProdDataPage_Title}
    wait until page contains element     ${ProductAttSetup_Section}
    wait until page contains element     ${table}
    wait until page contains element     ${tableRow}
Filter Product Attribute by Name filters
    [Arguments]     ${arg1}
    wait until page contains element    ${SelectFilter_ProdAttPage}
    Click element    ${SelectFilter_ProdAttPage}
    Sleep            2
    Press Keys       ${SelectFilter_ProdAttPage}    Name    RETURN
    Sleep            2
    Input Text       ${Input_Name}         ${arg1}
    Click Element    ${filterBtn}
    Sleep            2
    wait until page contains                              ${arg1}
Filter Product Attribute by Type filters
    wait until page contains element    ${SelectFilter_ProdAttPage}
    Click element    ${SelectFilter_ProdAttPage}
    Sleep            2
    Press Keys       ${SelectFilter_ProdAttPage}    Type    RETURN
    Sleep            2
    Click Element    ${Filter_Type}
    Press Keys       ${Filter_Type}       Enum       RETURN
    Click Element    ${filterBtn}
    Sleep            2

Verify Advanced filter is enabled for Product Data
    Wait until page contains element      ${Advanced_filterInactive_ProdAttPage}
    click element                         ${Advanced_filterInactive_ProdAttPage}
    wait until page contains element      ${Advanced_filterActive}
    wait until page contains element      ${ProdAttName_Advancedfilter}
    page should contain element           ${ProdAttType_Advancedfilter}
    page should contain element           ${ProdAttRequired_Advancedfilter}
Filter Product Attribute by Advanced-Name filters
    [Arguments]     ${arg1}
    click element                         ${Advanced_filterInactive}
    wait until page contains element      ${Advanced_filterActive}
    page should contain element           ${ProdAttName_Advancedfilter}
    input text                            ${ProdAttName_Advancedfilter}      ${arg1}
    click button                          ${filterBtn}
    sleep                                 3
    element should contain                ${table}                           ${arg1}
Filter Product Attribute by Advanced-Type filters
    [Arguments]     ${arg1}
    wait until page contains element      ${Advanced_filterActive}
    page should contain element           ${ProdAttType_Advancedfilter}
    Click Element                         ${ProdAttType_Advancedfilter}
    Press Keys                            ${ProdAttType_Advancedfilter}    Enum       RETURN
    click button                          ${filterBtn}
    sleep                                 3
    element should contain                ${table}                           ${arg1}
Verify Product Attribute filtering
    [Arguments]     ${arg1}
#    ${count} =     Get Element Count      ${tableRow}
#    should be equal as integers           ${count}       ${1}
    table should contain                  ${table}              ${arg1}
    table should contain                  ${table}              Enum
Add new Product Attribute
    page should contain button           ${AddNew_Btn}
    click button                         ${AddNew_Btn}
    wait until location is               ${CreateProdAttPage_URL}
Create a new Product Attribute
    page should contain element          ${createupdateprodatt_btn}
    click button                         ${createupdateprodatt_btn}
Fill in Product Attribute data
    [Arguments]     ${arg1}
    wait until page contains element      ${CreateProdAttPage_title}
    page should contain element           ${CreateProdAtt_section}
    page should contain element           ${InputProdAttName}
    page should contain element           ${ProdAttType_select}
    input text                            ${InputProdAttName}           ${arg1}
    Press Keys                             ${ProdAttType_select}       DOWN    RETURN
    #Page Should Contain                   ${Enum_InputField}
    Press Keys                            ${Enum_InputField}        Test1111     RETURN
Remove mandatory Product data
     [Arguments]     ${arg1}
    clear element text                    ${InputProdAttName}
    wait until page does not contain      ${arg1}
Verify Product Attribute is created
     [Arguments]     ${arg1}
    wait until location is                 ${ProdAttPage_URL}
    wait until page contains               Successfully created product attribute!
#    Filter Product Attribute by Single filters                          ${arg1}
    Filter Product Attribute By Advanced-Name Filters                           ${arg1}
Verify Product Attribute is not created
    location should be                     ${CreateProdAttPage_URL}
    #wait until page contains element      ${requiredfield_alert}
    page should contain element            ${ThisFieldIsRequired}
Verify Single filter is enabled for Product Attributes
    Wait until page contains element     ${singleFilter_field}
    Element should be enabled            ${Single_filter_ProdAttPageToggle}
Edit Product Attribute by adding valid data
    [Arguments]     ${arg1}
    click element                         ${Advanced_filterInactive}
    wait until page contains element      ${Advanced_filterActive}
    page should contain element           ${ProdAttName_Advancedfilter}
    input text                            ${ProdAttName_Advancedfilter}      ${arg1}
    click button                          ${filterBtn}
    sleep                                 3
    wait until page contains element       ${editbtn_prodatt}
    click element                          ${editbtn_prodatt}
    wait until page contains element       ${EditProdAttPage_Title}
    wait until page contains element       ${EditProdAttSection}
    wait until page contains element       ${InputProdAttName}
    page should contain element            ${ProdAttTypeEdit_Select}
    page should contain element            ${CreateUpdateProdAtt_Btn}
    input text                             ${InputProdAttName}                            ${Updated}
    click button                           ${CreateUpdateProdAtt_Btn}
Edit Product Attribute by removing mandatory data
    wait until page contains element       ${editbtn_prodatt}
    click element                          ${editbtn_prodatt}
    wait until page contains element       ${EditProdAttPage_Title}
    wait until page contains element       ${EditProdAttSection}
    wait until page contains element       ${InputProdAttName}
    page should contain element            ${ProdAttTypeEdit_Select}
    page should contain element            ${RemoveType}
    page should contain element            ${CreateUpdateProdAtt_Btn}
    click element                          ${RemoveType}
    sleep      2
    #clear element text                    ${custatttype_select}
    click button                           ${CreateUpdateProdAtt_Btn}
Verify Product Attribute is not updated
    page should contain element            ${EditProdAttSection}
    wait until page contains element       ${thisfieldisrequired}
    page should not contain element        ${SuccesfulUpdate_Msg2}
Verify Product Attribute is updated
    wait until page contains               ${SuccesfulUpdate_Msg2}
    wait until location is                 ${ProdAttPage_URL}
    wait until page contains element       ${productattsetup_section}
    Filter Product Attribute by Advanced-Name filters                     ${Updated}
    Verify Product attribute filtering                                ${Updated}
Choose Cancel when deleting a Product attribute
    Press Keys       ${SelectFilter_ProdAttPage}    Name    RETURN
    Sleep            2
    Input Text       ${Input_Name}         ${Updated}
    Click Element    ${filterBtn}
    Sleep            2
    wait until page contains                ${Updated}
    click element                           ${DeleteBtn_ProdAtt}
    wait until page contains element        ${Delete_Dialogue}
    wait until page contains element        ${CancelDelete_Btn}
    page should contain element             ${ConfirmDelete_Btn}
    click button                            ${CancelDelete_Btn}
Verify Product attribute is not deleted
    location should be                      ${ProdAttPage_URL}
    page should contain element             ${table}
    table should contain                    ${table}        ${Updated}
Choose Confirm when deleting a Product attribute
    click element                         ${Advanced_filterInactive}
    wait until page contains element      ${Advanced_filterActive}
    page should contain element           ${ProdAttName_Advancedfilter}
    input text                            ${ProdAttName_Advancedfilter}      ${Updated}
    click button                          ${filterBtn}
    sleep                                 3
    wait until page contains                ${Updated}
    click element                           ${DeleteBtn_ProdAtt}
    wait until page contains element        ${Delete_Dialogue}
    wait until page contains element        ${CancelDelete_Btn}
    page should contain element             ${ConfirmDelete_Btn}
    click button                            ${ConfirmDelete_Btn}
Verify Product attribute is deleted
    location should be                      ${ProdAttPage_URL}
    wait until page contains element        ${Delete_Dialogue}
    page should contain element             ${table}
    wait until page does not contain        ${Updated}
