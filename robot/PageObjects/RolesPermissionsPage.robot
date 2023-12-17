*** Variables ***

${RolesPermissions_Title}        //span[@class="page-title" and contains(.,"Roles and Permissions")]
${RolesPermissions_SaveBtn}      //button[@type="submit" and contains(.,"Save")]
${UserMatrix_Section}            //h5[@class="fb-600" and contains(.,"User matrix")]
${UserMatrix_Table}              //table[@class="RolesAndPermissions_table__3plLu table table-striped table-bordered table-hover"]
${UserRoles_Section}             //div[@class="table-responsive"]
${RolesPermissions_AddNewBtn}    //button[@class="btn btn-primary" and contains(.,"Add new")]
${AddRole_Section}               //h5[@class="fb-600" and contains(.,"Add role")]
${InputRoleName}                 //input[@id="roleName"]
${CreateRole_Btn}                //button[@class="btn btn-success" and contains(.,"Create")]
${NewRoleInMatrix}               //span[@class="RolesAndPermissions_rotateSpan__3kKer" and contains(.,"Automated role")]
${EditRole_Btn}                  (//span[@class="ml-1" and contains(.,"Edit")])
${EditRoleSection_Label}         //h5[@class="fb-600" and contains(.,"Edit role")]
${InputRoleName_Edit}            //input[@id="roleName" and @value="automated_role"]
${UpdateRole_Btn}                //button[@class="btn btn-success" and contains(.,"Update")]
${RoleName_Required}             //input[@id="roleName" and contains(@class,"danger")]
${DisabledDeleteRole_Btn}        (//span[@class="delete disabled"])[2]
${DeleteRole_Btn}                (//span[@class="ml-1" and contains(.,"Delete")])
${DeleteRole_Dialogue}           //div[contains(@class,("Modal"))]
${CancelDeleteRole_Btn}          //button[@type and contains(.,"Cancel")]
${ConfirmDeleteRole_Btn}         //button[@class="btn btn-primary" and contains(.,"Confirm")]
${SuperAdmin_Role}               (//span[contains(.,"Super admin")])[2]
${EditedRole}                    (//span[contains(.,"Edited")])[2]
${EditedRole_UserMatrix}         (//span[contains(.,"Edited")])[1]


