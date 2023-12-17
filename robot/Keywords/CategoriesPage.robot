*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CategoriesPage.robot
Resource          ../PageObjects/MainPage.robot
Resource          ../Resources/Testdata.robot


*** Keywords ***
Navigate to Categories page
    Click link          ${Categories_link}
    location should be  ${CategoriesUrlPath}
Verify Categories page
     wait until element is visible      ${CategoriesTitle_text}
     sleep    2
#Filtering verification still not done (Vale)

Filter Active Category by Single filters
    Click Element       ${SingleFilter_field_CategPage}
    Press Keys          ${SingleFilter_field_CategPage}    Slug    RETURN
    Input Text          ${SingleFilter_by_CategPage}       ${ActiveCategory_slug}
    Click Element       ${FilterBtn_CategPage}
    Sleep    2
    wait until page contains element    ${EditCateg_button}
Filter CRUD Category by Single filters
    wait until element is visible     ${table}
    Click Element       ${SingleFilter_field_CategPage}
    Press Keys          ${SingleFilter_field_CategPage}    Name    RETURN
    #press keys          ${SingleFilter_field_CategPage}
    #click element    //div[@id="react-select-23-option-0" and contains(.,"Name")]
    Input Text          ${SingleFilter_byName_CategPage}       ${updated_mock_test_data}
    Click Element       ${FilterBtn_CategPage}
    Sleep    2
    wait until page contains element    ${deletecateg_button}
Filter Inactive Category by Single filters
    Click Element       ${SingleFilter_field_CategPage}
    Press Keys          ${SingleFilter_field_CategPage}    Slug    RETURN
    Input Text          ${SingleFilter_by_CategPage}       ${InactiveCategory_slug}
    Click Element       ${FilterBtn_CategPage}
    Sleep    2
    wait until page contains element    ${EditCateg_button}

Navigate from Category -> Dashboard breadcrumb path
    Navigate to Categories page
Filter Updated Category
    Click Element       ${SingleFilter_field_CategPage}
    Press Keys          ${SingleFilter_field_CategPage}    Slug    RETURN
    Input Text          ${SingleFilter_by_CategPage}       ${Updated_mock_test_data}
    Click Element       ${FilterBtn_CategPage}
    Sleep    2
    wait until element contains    ${table}          ${Updated_mock_test_data}
Filter Deleted Category
    Click Element       ${SingleFilter_field_CategPage}
    Press Keys          ${SingleFilter_field_CategPage}    Slug    RETURN
    Input Text          ${SingleFilter_by_CategPage}       ${Updated_mock_test_data}
    Click Element       ${FilterBtn_CategPage}
    Sleep    2
    wait until element contains    ${table}          ${No_data}

