*** Settings ***
Library           SeleniumLibrary
Library           String

Resource          ../PageObjects/RolesPermissionsPage.robot
Resource          ../PageObjects/MainPage.robot
Resource          ../Resources/Testdata.robot
Resource          UsersPage.robot


*** Keywords ***
Verify Roles and Permissions page
    wait until location is               ${RolesPermissionsPage_URL}
    wait until element is visible        ${RolesPermissions_Title}
    wait until element is not visible    ${spiner}
    wait until element is visible        ${UserMatrix_Table}
    wait until element is visible        ${RolesPermissions_SaveBtn}
    wait until element is visible        ${UserRoles_Section}
    wait until element is visible        ${RolesPermissions_AddNewBtn}
Add new User role
    click button                         ${RolesPermissions_AddNewBtn}
    wait until element is visible        ${AddRole_Section}
    click element                        ${InputRoleName}
    input text                           ${InputRoleName}                   ${NewUserRole}
    click button                         ${CreateRole_Btn}
Verify new User role is created
    wait until element is not visible    ${Spiner}
    wait until element is visible        ${NewRoleInMatrix}
    wait until element contains          ${UserRoles_Section}               ${NewUserRole}
Navigate and Verify Roles ans Permissions page
    Navigate to Users page
    Navigate to Roles and Permissions Page
    Verify Roles and Permissions page
Start editing a User role
    ${Count}      Get Element Count         ${table2row}
    ${EditRoleBtn_last}   Catenate   SEPARATOR=	       ${EditRole_Btn}  [     ${Count}     ]
    wait until element is visible        ${EditRoleBtn_last}
    click element                        ${EditRoleBtn_last}
    wait until element is visible        ${EditRoleSection_Label}
    wait until element is visible        ${InputRoleName_Edit}
    input text                           ${InputRoleName_Edit}        ${EditedUserRoleName}
Save the edited User role
    click button                         ${UpdateRole_Btn}
  #  wait until page contains             Successfully updated Role data!
    sleep                                2
    location should be                   ${RolesPermissionsPage_URL}
Verify User role is edited
    wait until page does not contain     ${NewRoleInMatrix}
    wait until page contains             ${EditedUserRoleName}
Update User role by removing mandatory data
    ${Count}      Get Element Count      ${table2row}
    ${EditRoleBtn_last}   Catenate   SEPARATOR=	       ${EditRole_Btn}  [     ${Count}     ]
    wait until element is visible        ${EditRoleBtn_last}
    click element                        ${EditRoleBtn_last}
    wait until element is visible        ${EditRoleSection_Label}
    wait until element is visible        ${InputRoleName_Edit}
    click element                        ${InputRoleName_Edit}
    Press keys                           ${InputRoleName_Edit}       CTRL+A+DELETE
    click button                         ${UpdateRole_Btn}
Verify User role can't be edited with missing mantory data
    wait until page contains element     ${RoleName_Required}
Verify disabled Delete option for asigned User role
    wait until element is visible        ${DisabledDeleteRole_Btn}
    click element                        ${DisabledDeleteRole_Btn}
Verify asigned User role can not be deleted
    page should not contain element      ${DeleteRole_Dialogue}
    wait until element is visible        (//span[contains(.,"Super admin")])[2]
Delete an unassigned User role
    ${Count}      Get Element Count      ${table2row}
    ${DeleteRoleBtn_last}   Catenate   SEPARATOR=	       ${DeleteRole_Btn}  [     ${Count}     ]
    wait until element is visible        ${DeleteRoleBtn_last}
    click element                        ${DeleteRoleBtn_last}
    wait until element is visible        ${DeleteRole_Dialogue}
    wait until element is visible        ${CancelDeleteRole_Btn}
    wait until element is visible        ${ConfirmDeleteRole_Btn}
    click button                         ${CancelDeleteRole_Btn}
    wait until element is not visible    ${DeleteRole_Dialogue}
    click element                        ${DeleteRoleBtn_last}
    wait until element is visible        ${DeleteRole_Dialogue}
    wait until element is visible        ${CancelDeleteRole_Btn}
    wait until element is visible        ${ConfirmDeleteRole_Btn}
    click button                         ${ConfirmDeleteRole_Btn}
Verify an unasigned role is deleted
    wait until element is not visible    ${EditedRole_UserMatrix}
    wait until element is not visible    ${EditedRole}











