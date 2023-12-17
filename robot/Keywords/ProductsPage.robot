*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/HomePage.robot
Resource          ../PageObjects/LoginPage.robot
Resource          ../PageObjects/ProductsPage.robot
Resource          ../PageObjects/CreateProduct.robot
Resource          ../Resources/Testdata.robot
Resource          ../Keywords/Common.robot

*** Keywords ***
Navigate and verify Products page
    Click link       ${Products_link}
    Wait until page contains element    ${ProductsTitle_text}
    Location Should Be                         https://iwcuat-admin.iwcommerce.com/products
Verify Single filter is enabled
    Wait until page contains element    ${Single_filter_ProdPage}
    Element should be enabled           ${Single_filter_ProdPage}
Filter Product by Name
    wait until page contains element    ${SelectFiter_ProdPage}
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Name    RETURN
    Input Text       ${NameFilter_by_ProdPage}        ${Product_Name}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
Filter Product by Category
    wait until page contains element    ${SelectFiter_ProdPage}
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Categories    RETURN
    Input Text       ${CategoriesFilter_by_ProdPage}         ${filter_category_data}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
Filter Product by Slug
    wait until page contains element    ${SelectFiter_ProdPage}
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Slug    RETURN
    Input Text       ${SlugFilter_by_ProdPage}         ${filter_slug_data}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
Filter Product by Status
    wait until page contains element    ${SelectFiter_ProdPage}
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Status    RETURN
    Click Element    ${SelectFilter_Status}
    Press Keys       ${SelectFilter_Status}     PUBLISHED  RETURN
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
Filter Product by Created at
    wait until page contains element    ${SelectFiter_ProdPage}
    click element    ${CreatedAt_Options}
    press keys       ${CreatedAt_Options}      <
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Created at    RETURN
    Input text       ${CreatedAt_Filter_by_ProdPage}    ${filter_created_at_data}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
Filter Product by Updated at
    wait until page contains element    ${SelectFiter_ProdPage}
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Updated at    RETURN
    Input text       ${UpdatedAt_Filter_by_ProdPage}   ${filter_updated_at_data}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
Verify Advanced filter is enabled
    click element    ${Advanced_filter_ProdPage}
    Wait until page contains element   ${Filter_Advanced}
    Element should be enabled          ${Filter_Advanced}

Filter Product by Name-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${InputName_ProdPage}
    Input Text       ${InputName_ProdPage}        ${Product_Name}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
    Click Element    ${InputName_ProdPage}
    Press Keys       ${InputName_ProdPage}           CTRL+A+DELETE

Filter Product by Category-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${InputCategories_ProdPage}
    Input Text       ${InputCategories_ProdPage}        ${filter_category_data}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
    Click Element    ${InputCategories_ProdPage}
    Press Keys       ${InputCategories_ProdPage}          CTRL+A+DELETE

Filter Product by Slug-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${InputSlug_ProdPage}
    Input Text       ${InputSlug_ProdPage}       ${filter_slug_data}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
    Click Element    ${InputSlug_ProdPage}
    Press Keys       ${InputSlug_ProdPage}            CTRL+A+DELETE

Filter Product by Status-Advanced
    wait until page contains element    ${Filter_Advanced}
    Click element    ${SelectStatus_ProdPage}
    Press Keys       ${SelectStatus_ProdPage}    PUBLISHED  RETURN
    Click Element    ${Filter_button_ProdPage}
    Sleep            2


Filter Product by Created at-Advanced
    wait until page contains element    ${Filter_Advanced}
    click element    ${CreatedAt_Options}
    press keys       ${CreatedAt_Options}      <
    Click element    ${CreatedAt_dateInput_ProdPage}
    Input Text       ${CreatedAt_dateInput_ProdPage}       ${filter_created_at_data}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
Choose cancel when modifying the product - Selected products
    Click Element    ${Checkbox_select}
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element        ${MoreOpt_ChangeStatusSelected}
    Click Element     ${Select_Status}
    Press Keys        ${Select_Status}     Unpublished    RETURN
    Click Element     ${Cancel_button}
    sleep              2
    Page Should Not Contain     ${SuccesfulUpdate_Products}
Choose confirm when modifying the product - Selected products
#    Click element    ${SelectFiter_ProdPage}
#    Press Keys       ${SelectFiter_ProdPage}    Name    RETURN
#    Input Text       ${NameFilter_by_ProdPage}        ${Product_Name}
#    Click Element    ${Filter_button_ProdPage}
#    Sleep            5
#    Click Element    ${Checkbox_select}
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ChangeStatusSelected}
    Click Element     ${Select_Status}
    Press Keys        ${Select_Status}     Unpublished    RETURN
    Click Element     ${Confirm_button}
    wait until page contains  ${SuccesfulUpdate_Products}
    sleep              2
Choose cancel when modifying the product - All products
    Click Element     ${Checkbox_select}
    Click Element     ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ChangeStatusAll}
    sleep              2
    Click Element     ${Select_Status}
    Press Keys        ${Select_Status}     Unpublished    RETURN
    Click Element     ${Cancel_button}
    sleep              2
    Page Should Not Contain     ${SuccesfulUpdate_Products}
Choose confirm when modifying the product - All products
#    Clear Element Text          ${NameFilter_by_ProdPage}
#    Click Element    ${Filter_button_ProdPage}
#    Sleep            2
##    Click Element     ${Checkbox_select}
##    sleep             2
    Click Element     ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ChangeStatusAll}
    Click Element     ${Select_Status}
    Press Keys        ${Select_Status}     Unpublished    RETURN
    Click Element     ${Confirm_button}
    wait until page contains  ${SuccesfulUpdate_Products}
    sleep              2
Choose confirm when exporting the product - Selected products
    Click Element    ${Checkbox_select}
    Click Element    ${MoreOptionsBtn_ProdPage}
    sleep            2
    Click Element     ${MoreOpt_ExportSelected}
    sleep              2
    Click Element     ${Confirm_button}
    wait until page contains  ${SuccesfulDownload}
    sleep              2
Choose cancel when exporting the product - Selected products
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Name    RETURN
    Input Text       ${NameFilter_by_ProdPage}        ${Product_Name}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
    Click Element    ${Checkbox_select}
    sleep             2
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ExportSelected}
    sleep             2
    Click Element     ${Cancel_button}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
    Click Element    ${Checkbox_select}
Choose confirm when exporting the product - All products
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Name    RETURN
    Input Text       ${NameFilter_by_ProdPage}        ${Product_Name}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
#    Click Element    ${Checkbox_select}
    sleep             2
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ExportAll}
    sleep             2
    Click Element     ${Confirm_button}
    wait until page contains  ${SuccesfulDownload}
    sleep              2
Choose cancel when exporting the product - All products
    Click element    ${SelectFiter_ProdPage}
    Press Keys       ${SelectFiter_ProdPage}    Name    RETURN
    Input Text       ${NameFilter_by_ProdPage}        ${Product_Name}
    Click Element    ${Filter_button_ProdPage}
    Sleep            2
#    Click Element    ${Checkbox_select}
    sleep              2
    Click Element    ${MoreOptionsBtn_ProdPage}
    Click Element     ${MoreOpt_ExportAll}
    sleep              2
    Click Element     ${Cancel_button}
    Page Should Not Contain      ${SuccesfulDownload}
    sleep              2
#    Click Element    ${Checkbox_select}