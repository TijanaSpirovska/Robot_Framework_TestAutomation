*** Settings ***
Library           SeleniumLibrary
Library           String
Resource          ../PageObjects/UsersPage.robot
Resource          ../Resources/Testdata.robot

*** Keywords ***
Navigate to Users page
    wait until location is                           ${DashboardPage_URL}
    click element                                    ${UserProfileBtn}
    click element                                    ${SelectConfigurationProfile}
    wait until location is                           ${ConfigurationPage_URL}
    wait until element is visible                    ${UsersSectionInCOnfirguration}
    click element                                    ${UsersSectionInCOnfirguration}
Navigate to Roles and Permissions Page
    wait until element is visible                    ${RolesPermissionsBtn}
    click button                                     ${RolesPermissionsBtn}
Verify Users page
    wait until element is visible                    ${RolesPermissionsBtn}
    wait until element is visible                    ${AddUserBtn}
    checkbox should be selected                      ${ExcludeCustomersCheckbox_selected}
Verify Users Single filter is enabled
    wait until element is visible                    ${SingleFilter_by_UsersPage}
    wait until element is visible                    ${singlefilteractive_userspage}
    wait until element is visible                    ${SelectFilter_UsersPage}
Single filter new User
    click element                                    ${ExcludeCustomersCheckbox}
    wait until element is not visible                ${spiner}
    Click element                                    ${SelectFilter_UsersPage}
    Press Keys                                       ${SelectFilter_UsersPage}       Email    RETURN
    Input Text                                       ${SingleFilter_by_UsersPage}    ${mock_user_email}
    click button                                     ${FilterBtn_UsersPage}
    wait until element is visible                    ${HighlightedUserEmail}
    sleep                                             3
    wait until element is visible                    ${InactiveBadge_UsersPage}
    wait until element is visible                    ${EditUserBtn}
    wait until element is visible                    ${InactiveBadge_UsersPage}
Single filter User
    Click element                                    ${SelectFilter_UsersPage}
    Press Keys                                       ${SelectFilter_UsersPage}       Email    RETURN
    Input Text                                       ${SingleFilter_by_UsersPage}    ${UserFilterKeyword}
    click button                                     ${FilterBtn_UsersPage}
    wait until element is visible                    ${FilterHighlihtedText_Users}

Filter Users by Advanced filters
    wait until element is visible                    ${AdvancedFilterInactive_UsersPage}
    click element                                    ${AdvancedFilterInactive_UsersPage}
    wait until element is visible                    ${AdvancedFilterActive_UsersPage}
    wait until element is visible                    ${AdvancedNameInputFilter_Users}
    wait until element is visible                    ${AdvancedStatusSelectFilter_Users}
    wait until element is visible                    ${AdvancedEmailInputFilter_Users}
    wait until element is visible                    ${AdvancedStatusSelectFilter_Users}
    click element                                    ${AdvancedNameInputFilter_Users}
    input text                                       ${AdvancedNameInputFilter_Users}       ${UserFilterKeyword}
    click element                                    ${AdvancedStatusSelectFilter_Users}
    press keys                                       ${AdvancedStatusSelectFilter_Users}    active    RETURN
    wait until element is visible                    ${StatusFilterActive_Users}
    click button                                     ${AdvancedFilterBtn_User}
    wait until element is visible                    ${FilterHighlihtedText_Users}
Reset Advanced Users filter
    click button                                     ${ResetFilterBtn}
    wait until element is visible                    ${AdvancedStatusSelectFilter_Users}



