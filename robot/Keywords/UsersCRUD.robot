*** Settings ***
Library           SeleniumLibrary
#Library           Browser
Library           String
Resource          ../PageObjects/UsersPage.robot
Resource          ../PageObjects/UsersCRUD.robot
Resource          ../PageObjects/MainPage.robot
Resource          ../Resources/Testdata.robot
Resource          UsersPage.robot


*** Keywords ***

Navigate to Create User page
    click button                       ${AddUserBtn}
    wait until location is             ${UserCreatePage}
Verify Create User page
    wait until element is visible       ${CreatUserPageTtileElement}
    wait until element is visible       ${InputName_CreUser}
    wait until element is visible       ${InputEmail_CreUser}
    wait until element is visible       ${SelectRoles_CreUser}
    page should not contain element     ${ActiveCheckbox_CreUser}
    sleep        2
    #wait until element is visible       ${ChooseImage_CreUser}
    wait until element is visible       ${CreateBtn_CreUser}
Navigate to Edit User page
    click element                      ${EditUserBtn}
    wait until page contains element   ${EditUserPageTtileElement}
Verify Edit User page
    wait until element is visible   ${InputName_CreUser}
    wait until element is visible      ${EmailReadOnly_CreUser}
    wait until element is visible      ${SelectRoles_CreUser}
    wait until element is not visible  ${ActiveCheckbox_CreUser}
   # wait until element is visible      ${ChooseImage_CreUser}
    wait until element is visible      ${UpdateBtn_CreUser}
Add values to mandatory User fields
    input text                         ${InputName_CreUser}        ${mock_user_name}
    input text                         ${InputEmail_CreUser}       ${mock_user_email}
    input text                         ${SelectRoles_CreUser}      ${Role1}
    sleep                               5
    Press Keys                         ${SelectRoles_CreUser}      RETURN
    #Press Keys                         ${SelectRoles_CreUser}      ENTER
Add additional values from Edit User page
    input text                         ${SelectRoles_CreUser}      ${Role2}
    sleep                               5
    Press Keys                         ${SelectRoles_CreUser}      RETURN
#    choose file                        ${ChooseImage_CreUser}      ${ImageExample}
    #select checkbox                    ${InactiveCheckbox_CreUser}
Create and verify new user
    click button                       ${CreateBtn_CreUser}
    sleep                              2
    wait until location is             ${UsersPage}
   # wait until page contains element   Successfully created profile!
    single filter new user
Create and verify new user can not be created with duplicate email
   click button                        ${CreateBtn_CreUser}
   wait until page contains element    ${InvalidData_CreUser}
   page should contain element         ${EmailTakenError_CfreUser}
   location should be                  ${usercreatepage}
   wait until page contains element    ${emailtakenerror_cfreuser}
Remove value from mandatory field
   wait until element is visible       ${InputEmail_CreUser}
   Press Keys                          ${InputEmail_CreUser}     CTRL+A+DELETE
Create and verify new user can not be created with missing mandatory field
   click button                        ${CreateBtn_CreUser}
   location should be                  ${usercreatepage}
   wait until element is visible            ${MissingEmailAdd}
Update and verify user can not be updated with missing mandatory field
   wait until element is visible       ${UpdateBtn_CreUser}
   click button                        ${UpdateBtn_CreUser}
   wait until element is visible       ${EditUserPageTtileElement}
   sleep                               2
   wait untiL element is visible       ${MissingEmailAdd}      30sec
Update and verify user can be updated by adding data
   wait until element is visible       ${UpdateBtn_CreUser}
   click button                        ${UpdateBtn_CreUser}
   wait until page contains            Successfully updated User data!
   wait until location is              ${UsersPage}
   single filter new user
   sleep                               2
   wait until element is not visible   ${spiner}
   wait until element contains         ${table}       Marketing specialist
Verify Super admin role can not be added to user
   Click element                       ${SelectRoles_CreUser}
   Press Keys                          ${SelectRoles_CreUser}      Super           RETURN
   wait until page contains            No options
   page should not contain             ${SuperAdminRole}
Delete user from Users Page
   wait until element is visible       ${DeleteUserBtn}
   click element                       ${DeleteUserBtn}
   wait until element is visible       ${ConfirmDeleteUser_btn}
   click button                        ${ConfirmDeleteUser_btn}
   wait until page contains            No data
Navigate to the Create User page
    Navigate to Users page
    Verify Users page
    Navigate to Create User page
    Verify Create User page
Navigate to teh Edit User page
    Navigate to Edit User page
    Verify Edit User page





