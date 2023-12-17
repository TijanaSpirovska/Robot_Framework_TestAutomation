*** Variables ***

${HighLighted_ActiveCategory}   //span[@class="highlight" and contains(.,"auto-test")]      #Highlighted category after filtering
${DeleteCateg_DisabledButton}  //span[@class="flex items-center delete disabled"]           #This is a disabled delete button for a category
${CancelDeleteCateg_btn}       //button[@class="btn btn-light" and contains(.,"Cancel")]                        #This button appears in a popup dialog and cancels the category deletion
