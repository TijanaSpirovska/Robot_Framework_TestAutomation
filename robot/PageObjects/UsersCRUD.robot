*** Variables ***

${InputName_CreUser}           //input[@id="name" and contains(@class,"false")]
${InputNameError_CreUser}      //input[@id="name" and contains(@class,"border-danger")]
${InputEmail_CreUser}          //input[@name="email"]
#${SelectRoles_CreUser}         (//div[@class="form-group"]//descendant::input)[3]
${SelectRoles_CreUser}         (//input[@autocomplete="off"])[2]
${ActiveCheckbox_CreUser}      //input[@type="checkbox" and @id="status" and @checked]/parent::*
${InactiveCheckbox_CreUser}    //input[@type="checkbox" and @id="status"]/parent::*
${ChooseImage_CreUser}         //input[@type="file"]
${CreateBtn_CreUser}           //button[@type="submit" and contains(.,"Create")]
${UpdateBtn_CreUser}           //button[@type="submit" and contains(.,"Update")]
${DeleteUserBtn}               //span[@class="ml-1" and contains(.,"Delete")]
${EditUserBtn}                 //span[@class="ml-1" and contains(.,"Edit")]
${InvalidData_CreUser}         //h5[@class="alert-heading"]
${EmailTakenError_CfreUser}    //li[@class="small" and contains(.,"The email has already been taken.")]
${EditUserPageTtileElement}    //span[@class="page-title" and contains(.,"Edit User") ]
${CreatUserPageTtileElement}   //span[@class="page-title" and contains(.,"Create User") ]
${ConfirmDeleteUser_btn}       //button[@class="btn btn-primary" and contains (.,"Confirm")]
${EmailReadOnly_CreUser}       //input[@type="email"and @value="valetest@test.com"]
${Role1_cloud}                 //div[contains(@class,("multi")) and contains(.,"Product manager")]
${Role2_cloud}                 //div[contains(@class,("multi")) and contains(.,"Marketing specialist")]
${MissingEmailAdd}             //label[contains(.,"Enter email address")]//following::div[contains(@class,"danger")]