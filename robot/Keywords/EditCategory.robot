*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/CategoriesPage.robot
Resource          ../PageObjects/CreateCategory.robot
Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/EditCategoryPage.robot
Resource           CategoriesPage.robot


*** Keywords ***
Navigate to Edit Category page
    click element                     ${EditCateg_button}
    wait until element is visible     ${EditCategoryTitle_text}
    location should contain           ${EditCategoryUrlPath}
Verify the Edit Category page contains all the default elements
    wait until element is visible     ${SelectMainCateg_EditCategPage}
    #wait until element is visible     ${InputDescription_EditCategPage}
    wait until element is visible     ${InputCategName_EditCategPage}
    wait until element is visible     ${InputSlug_EditCategPage}
    wait until element is visible     ${ImageUploaded}
    wait until element is visible     ${UpdateBtn_EditCategPage}
    wait until element is visible     ${CategoryOrder}
    wait until element is visible     ${CategoryVisible}
Delete data from mandatory field in Edit Category page
    select frame              ${InputDescription_EditCategPage}
    clear element text        ${InputDescription_CreateCategPage}
    unselect frame
    Clear element text                ${InputCategName_EditCategPage}
#    Clear element text                ${InputSlug_EditCategPage}
    sleep    2
Update edited Category
    Click button                      ${UpdateBtn_EditCategPage}
Verify Category can be updated after adding data in existing fields
    wait until element is visible     ${CategoriesTitle_text}
    Filter Active category by Single filters
    Navigate to Edit Category page
    wait until element is visible     ${InputCategName_EditCategPage}
    textfield should contain          ${InputCategName_EditCategPage}  Vale123

Verify CRUD Category can be updated
    Filter CRUD Category by Single filters
Verify Category can not be edited with empty mandatory fields
    wait until element is visible       ${CategNameRequired_error_msg}
    wait until element is visible       ${CategDescRequired_error_msg}
    wait until element is visible       ${CategSlugRequired_error_msg}
    Location should contain           ${EditCategoryUrlPath}
Add data to existing Category Name data field
    Click element                     ${InputCategName_EditCategPage}
    Press keys                        ${InputCategName_EditCategPage}   ${updatename_apendix}     RETURN
    click element                     ${CategoryOrder}
    input text                        ${CategoryOrder}             3
Add data to existing Slug field
    Clear element text                ${InputCategName_EditCategPage}
    Click element                     ${InputCategName_EditCategPage}
    Press keys                        ${InputCategName_EditCategPage}     autotest2     RETURN
Verify Category can not be updated after adding a duplicate slug
    Update edited Category
    location should contain            ${EditCategoryUrlPath}
    wait until page contains element   ${InvalidDataAlert_EditCategPage}
Test Category data clean up
    Clear element text                 ${InputCategName_EditCategPage}
    Click element                      ${InputCategName_EditCategPage}
    Press keys                         ${InputCategName_EditCategPage}     auto test Vale (DO NOT DELETE)     RETURN
    Sleep     5
#    click button                       ${UpdateBtn_EditCategPage}



