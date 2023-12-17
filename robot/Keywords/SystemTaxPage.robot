*** Settings ***
Library     SeleniumLibrary
Resource    ../PageObjects/SystemTaxPage.robot
Resource    ../PageObjects/MainPage.robot
Resource    ../Resources/Testdata.robot
Library     String

*** Keywords ***
#Go to System Tax Page
#    Wait until element is visible        ${profilePicBtn}
#    Click Button                         ${profilePicBtn}
#    Click Link                           ${configurationLink}
#    Location should be                   ${configurationUrlPath}
#    Wait until element is visible        ${TaxProvidersSection}
#    Click Link                           ${TaxProvidersSection}
#    Wait until location is               ${TaxProvidersUrl}
#    Click link                           ${SystemTaxTab}
#    Wait until location is               ${SystemTaxUrl}
#
#Go To Create System Tax Page
#    Wait until page contains element     ${addTaxBtn}
#    click button                         ${addTaxBtn}
#    Location Should Be                   ${createTaxUrl}
#    Page Should Contain Element          ${createBtn}
#
#Choose Random Record in the table
#    Wait until page contains element     ${table}
#    ${elementCount}      Get Element Count        ${tableRow}
#    ${randomNumberInRange}    Evaluate  random.randint(1, ${elementCount})
#    return from keyword    ${randomNumberInRange}
#
#Single filter & Confirm
#    [Arguments]    ${arg1}
#    Wait until page contains element     ${singleFilter_field}
#    Click Element                        ${singleFilter_field}
#    Press Keys                           ${singleFilter_field}        ${filterName}     RETURN
#    Input Text                           ${singleFilterInputField}            ${arg1}
#    Click button                         ${filterBtn}
#    sleep    2
#    ${randomRecord}    Choose Random Record in the table
#    ${randomRowFirstTD}    CATENATE    SEPARATOR=    ${tableRow}  [  ${randomRecord}  ]    ${firstTD}
#    Element Should Contain               ${randomRowFirstTD}        ${arg1}      ${None}     ${True}
#

Filter by Advanced filter
    [Arguments]     ${arg1}
    Wait until page contains element     ${singleFilter_field}
    Click element                        ${advanced_Filter_Element}
    Input text                           ${advancedNameInput}                       ${arg1}
    Click button                         ${filterBtn}

#Advanced filter & Confirm element is there
#    [Arguments]     ${arg1}
#    Filter by Advanced filter            ${arg1}
#    sleep    2
#    ${randomRecord}    Choose Random Record in the table
##   form xpath for a random row in the table where the we will get the value from its first TD html element
#    ${randomRowFirstTD}    CATENATE    SEPARATOR=    ${tableRow}  [  ${randomRecord}  ]    ${firstTD}
#    Wait until element is not visible    ${tableSpinner}
#    Wait Until Element Contains          ${table}                   ${arg1}
##   Element Should Contain has 4 args, of which: ${None} e bukvalno None, a ${True} e true. P.S. ctrl + click na varijablite za da gi vidis kako i kade se definirani
#    Element Should Contain                           ${randomRowFirstTD}        ${arg1}      ${None}     ${True}
#
#Advanced filter & Confirm element is not there
#    [Arguments]     ${arg1}
#    Filter by Advanced filter                        ${arg1}
#    Wait until element is not visible                ${tableSpinner}
#    Wait Until Element Does Not Contain              ${table}       ${arg1}
#
#Change the filter type
## check which filter was last used and switch to the other one
#    [Arguments]     ${arg1}
#    ${boolean}=      Run Keyword And Return Status       Page should contain element      ${switchToSingleFilter}
#    IF    ${boolean} == True
#        Click element    ${switchToSingleFilter}
#        Wait until element is not visible               ${tableSpinner}
#        Element Should Be Disabled                      ${singleFilterInputField}
#        Element Should Not Contain                      ${singleFilterInputField}       ${arg1}
#    ELSE
#        Click element    ${advanced_Filter_Element}
#        Wait until element is not visible               ${tableSpinner}
#        Element Should Not Contain                      ${advancedNameInput}            ${arg1}
#    END
#
#Create System Tax
#    ${random1}    String.Generate Random String    9    [NUMBERS]
#    ${randomKey}    Catenate    Key${random1}
#    Input Text     ${taxNameInput}        ${taxName}
#    Input Text     ${keyInput}            ${randomKey}
#    Input Text     ${descriptionInput}    ${descriptionTaxValue}
#    Input Text     ${taxCatName}          Firmarina
##    Wait until element is visible       ${countryDropDown}
#    sleep    2
#    Press keys                          ${countryDropDown}     United States of America    RETURN
#    sleep    2
#    Input Text                          ${rateInput}           0.1
#    Click Button                        ${createBtn}
#    Wait until location is              ${systemTaxUrl}
#    wait until page contains element    ${addTaxBtn}


#Edit Tax
#    Wait until element is not visible    ${tableSpinner}
#    ${randomNumberInRange}    Choose Random Record in the table
#    ${randomEditXpathElement}    Catenate   SEPARATOR=	  ${editBtn}    [    ${randomNumberInRange}    ]
#    Click element                         ${randomEditXpathElement}
#    Wait until element is visible         ${stateInput}
#    ${random1}    String.Generate Random String    9    [NUMBERS]
#    ${randomKey}    Catenate    Key${random1}
#    Input Text     ${taxNameInput}        ${taxName2}
#    Input Text     ${keyInput}            ${randomKey}
#    Input Text     ${descriptionInput}    ${descriptionTaxValue2}
#    Input Text     ${taxCatName}          Danok na Imot
#    Wait until element is visible         ${countryDropDown}
#    Press keys                            ${countryDropDown}     United States of America    RETURN
##    Wait until element is visible         ${stateInput}
##    Input Text                            ${stateInput}          Illinois
#    sleep    2
#    Input Text                            ${rateInput}           0.1
#    Click Button                          ${updateBtn}
#    Wait until page contains element      ${addTaxBtn}
#    Wait until location is                ${systemTaxUrl}

#Delete System Tax
#    ${randomNumberInRange}    Choose Random Record in the table
#    ${randomDeleteXpathElement}    Catenate   SEPARATOR=	  ${deleteRowBtn}    [    ${randomNumberInRange}    ]
#    Wait until element is not visible           ${tableSpinner}
#    Click element                               ${randomDeleteXpathElement}
#    Wait until page contains element            ${confirmationModal}
#    Element should contain                      ${confirmBtn}                      CONFIRM
#    Element should contain                      ${cancelBtn}                       CANCEL
#    Click button                                ${confirmBtn}
#    Wait Until Element Does Not Contain         ${table}                           ${tableIsEmpty}

Navigate and verify System Tax page
    wait until location is                      ${DashboardPage_URL}
    wait until element is visible               ${AvatarBtn}
    click element                               ${AvatarBtn}
    click element                               ${Configuration}
    wait until location is                      ${ConfigurationPage_URL}
    Wait until element is visible               ${TaxProvidersSection}
    Click Link                                  ${TaxProvidersSection}
    Wait until location is                      ${TaxProvidersUrl}
    Click link                                  ${SystemTaxTab}
    Wait until location is                      ${SystemTaxUrl}
    wait until element is not visible           ${Spiner}
    wait until element is visible               ${Table}
    wait until element is visible               ${singleFilter_field}
    wait until element is visible               ${advanced_Filter}
    wait until element is visible               ${AddTaxBtn}

Add/Create a new System Tax
    [Arguments]    ${arg1}
    click button                                ${AddTaxBtn}
    wait until location is                      ${createTaxUrl}
    wait until element is visible               ${CreateTaxPage_Title}
    wait until element is visible               ${taxnameinput}
    wait until element is visible               ${keyInput}
    wait until element is visible               ${descriptionInput}
    wait until element is visible               ${countryDropDown}
    wait until element is visible               ${rateInput}
    wait until element is visible               ${AddNew_TaxCategory}
    wait until element is visible               ${DeleteTaxCategBtn}
    Input text                                  ${taxnameinput}      ${arg1}
    input text                                  ${keyInput}          Key12345
    press keys                                  ${descriptionInput}  ${arg1}
    click element                               ${countryDropDown}
    Press keys                                  ${countryDropDown}       Republic of North Macedonia     RETURN
    Input text                                  ${taxcatname}      ${arg1}
    press keys                                  ${rateInput}        0
    click button                                ${createBtn}
Single filter System Tax
    [Arguments]    ${arg1}
    Wait until element is not visible           ${spiner}
    Wait until page contains element            ${singleFilter_field}
    click element                               ${singleFilter_NameField}
    Press Keys                                  ${singleFilter_NameField}        ${filterName}           RETURN
    Input Text                                  ${singleFilterInputField}        ${arg1}
    Click Element                               ${filterBtn}
Verify new System Tax is successfully created
    [Arguments]    ${arg1}
    Single filter System Tax                    ${SystemTax_MockText}
    wait until element contains                 ${table}                         ${arg1}

Edit System Tax
    [Arguments]    ${arg1}
    click element                               ${editBtn}
    wait until element is visible               ${editPageTitle}
    wait until element is visible               ${taxnameinput}
    wait until element is visible               ${keyInput}
    wait until element is visible               ${descriptionInput}
    wait until element is visible               ${countryDropDown}
    wait until element is visible               ${rateInput}
    wait until element is visible               ${AddNew_TaxCategory}
    wait until element is visible               ${DeleteTaxCategBtn}
    click element                               ${taxnameinput}
    Press keys                                  ${taxnameinput}                CTRL+A+BACKSPACE
    sleep                                               3
    click element                               ${taxnameinput}
    press keys                                  ${taxnameinput}                ${arg1}
    click button                                ${updateBtn}
    wait until location is                      ${systemTaxUrl}                10sec
Advanced filter System Tax
    [Arguments]    ${arg1}
    wait until element is not visible    ${spiner}
    wait until location is               ${systemTaxUrl}
    click element                        ${advanced_Filter}
    wait until element is not visible    ${spiner}
    wait until element is visible        ${Advanced_filter_name}
    wait until element is visible        ${Advanced_filter_key}
    wait until element is visible        ${Advanced_filter_desc}
    wait until element is visible        ${filterBtn}
    wait until element is visible        ${resetBtn}
    input text                           ${Advanced_filter_name}      ${arg1}
    #input text                           ${Advanced_filter_desc}      ${arg1}
    click button                         ${filterBtn}
Verify System Tax is successfully updated
    [Arguments]    ${arg1}
    Advanced filter System Tax           ${SystemTax_MockText2}
    wait until element contains          ${table}                     ${arg1}
    wait until element contains          ${table}                     Key12345
Delete a System Tax
    [Arguments]    ${arg1}
    Single filter System Tax             ${SystemTax_MockText2}
    Verify System Tax is successfully updated      ${SystemTax_MockText2}
    Click element                        ${deleteBtn}
    wait until element is visible        ${confirmationModal}
    wait until element is visible        ${confirmBtn}
    wait until element is visible        //button[@type="button" and contains(.,"Cancel")]
    click button                         //button[@type="button" and contains(.,"Cancel")]
    wait until element contains            ${table}                      ${arg1}
    Click element                        ${deleteBtn}
    wait until element is visible        ${confirmationModal}
    click button                         ${confirmBtn}
    wait until element is not visible    ${Spiner}
    wait until element does not contain  ${table}                      ${arg1}
Verify System Tax is successfully deleted
    [Arguments]    ${arg1}
    Advanced filter System Tax           ${SystemTax_MockText2}
    wait until element is not visible    ${Spiner}
    wait until element does not contain  ${table}                      ${arg1}
Switch to Single filter
    click element                        //div[@class="switch-item" and contains(.,"Single")]
