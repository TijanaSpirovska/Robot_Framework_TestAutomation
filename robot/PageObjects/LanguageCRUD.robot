*** Variables ***

${LanguagesInConfirguration}    //div[@class="Configuration_content__Z5G-Y" and contains(.,"Languages")]
${LanguagePage_Title}           //span[@class="page-title" and contains(.,"Languages")]
${LanguageSetUp}                //h6[@class="section-title" and contains(.,"Language setup")]
${AddLanguage_Select}           //div[contains(@class,"value-container")]
${Language_USA}                 //tr[td[text()='United States of America (the)'] and td[text()='USA']]
${Language_ALB}                 //tr[td[text()='Albania'] and td[text()='ALB']]
${Default_USA_Language}         //input[@type="radio" and @id="USA" and @checked]
${Default_ALB_Language}         //input[@type="radio" and @id="ALB" and @checked]
${DeleteLangBtn}                (//span[@class="ml-1" and contains(.,"Delete")])
${SaveLanguage_Btn}             //button[@class="btn btn-primary" and contains(.,"Save")]
${DeleteLanguage_first}         //span[@class="ml-1" and contains(.,"Delete")][1]
${SetasDefault_Alb}             //label[@class='rb-label form-label' and @for='ALB']/parent::*
${SetasDefault_Usa}             //label[@class='rb-label form-label' and @for='USA']/parent::*
