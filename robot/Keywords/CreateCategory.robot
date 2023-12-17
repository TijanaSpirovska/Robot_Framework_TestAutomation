*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CategoriesPage.robot
Resource          ../PageObjects/CreateCategory.robot
Resource          ../PageObjects/MainPage.robot
Resource          ../Resources/Testdata.robot



*** Keywords ***
Add a Category
    Click button                        ${AddCategoryBtn_CategPage}
    wait until element is visible       ${CreateCategoryTitle_text}
    location should be                  ${CreateCategoryUrlPath}
Add values to the mandatory Category fields
    Input text      ${InputCategName_CreateCategPage}       ${mock_test_data}
    should be lower case      ${InputSlug_CreateCategPage}            ${mock_test_data}
    choose file     ${CategImageInput}                    ${ImageExample}
    sleep           2
    select frame    ${DescriptionTextBox_CreateCategPage}
    Input text      ${InputDescription_CreateCategPage}     ${test_description}
    unselect frame
    sleep       2


Add values to non-mandatory fields
    input text  ${SelectMainCateg_CreateCategPage}      ${mock_test_category}
    sleep      3
    Press keys     ${SelectMainCateg_CreateCategPage}        RETURN
#    #click element    //div[@id="react-select-21-option-0" and contains(.,"Desktops")]
    wait until page contains    ${mock_test_category}
#    Wait Until Element Is Enabled      ${SelectMainCateg_CreateCategPage}
    click element   ${SelectMainCateg_CreateCategPage}
    press keys      ${SelectMainCateg_CreateCategPage}      ${mock_test_category}     RETURN
#    Press Keys      ${SelectMainCateg_CreateCategPage}      ENTER

Complete the category creation
    Click button    ${CreateBtn_CreateCategPage}
    sleep           3
    wait until location is                                  ${CategoriesUrlPath}
Complete the category creation with missing mandatory fields
    Click button    ${CreateBtn_CreateCategPage}
Verify Category is successfully created
   Click element    ${Advanced_filter_CategPage}
   Input text       ${InputSLug_CategPage}                  ${mock_test_data}
   Click button     ${FilterBtn_CategPage}
   Wait until page contains                                 ${mock_test_data}
Verify Category can not be created with missing mandatory values
   wait until element is visible        ${CategNameRequired_error_msg}
   wait until element is visible        ${CategDescRequired_error_msg}
   wait until element is visible              ${CategSlugRequired_error_msg}
   location should be                                       ${CreateCategoryUrlPath}
Delete category
   Click element    ${DeleteCateg_button}
Delete new category(clenup data)
   Click element    ${DeleteCateg_button}
   Click button     ${ConfirmDeleteCateg_btn}
   wait until element is not visible    ${CategorrDelete_Dialog}
Verify Category data is sccessfully cleaned
   wait until location is    ${categoriesurlpath}
   click button     ${ResetFilter}
   Wait Until Element Is NOT visible    ${Spiner}    30s
   Input text       ${InputName_CategPage}                  ${updated_mock_test_data}
   Click button     ${FilterBtn_CategPage}
   wait until element contains    ${table}          ${tableIsEmpty}
