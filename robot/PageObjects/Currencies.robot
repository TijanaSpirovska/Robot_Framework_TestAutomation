*** Variables ***

${CurrenciesInConfirguration}   //div[@class="Configuration_content__Z5G-Y" and contains(.,"Currencies")]
${CurrenciesPage_Title}         //span[@class="page-title" and contains(.,"Currencies")]
${CurrencySetUp}                //h6[@class="section-title" and contains(.,"Currency setup")]
${AddCurrency_Select}           //div[contains(@class,"value-container")]
${Currency_USD}                 //tr[td[text()='US Dollar'] and td[text()='USD']]
${Currency_EUR}                 //tr[td[text()='Euro'] and td[text()='EUR']]
${Default_USD_Currency}         //input[@type="radio" and @id="USD" and @checked]
${Default_EUR_Currency}         //input[@type="radio" and @id="EUR" and @checked]
${DeleteCurrency_first}         (//span[@class="ml-1" and contains(.,"Delete")])[1]
${DeleteCurrency_Btn}           (//span[@class="ml-1" and contains(.,"Delete")])
${SaveCurrency_Btn}             //button[@class="btn btn-primary" and contains(.,"Save")]
${SetasDefault_Eur}             //label[@class='rb-label form-label' and @for='EUR']/parent::*
${SetasDefault_Usd}             //label[@class='rb-label form-label' and @for='USD']/parent::*