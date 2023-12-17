*** Settings ***
Library           SeleniumLibrary
Library           String

Resource          ../Resources/Testdata.robot
Resource          ../PageObjects/CustomerDataCRUD.robot
Resource          ../PageObjects/UsersPage.robot
Library           SeleniumLibrary
Library           String
Resource          ../Keywords/CustomerDataCRUD.robot

*** Keywords ***
Navigate to Customer Data page
    wait until location is               ${DashboardPage_URL}
    click element                        ${UserProfileBtn}
    click element                        ${SelectConfigurationProfile}
    wait until location is               ${ConfigurationPage_URL}
    wait until page contains element     ${CustDataInConfirguration}
    click element                        ${CustDataInConfirguration}
Verify Customer Data page
    wait until location is               ${CustDataPage_URL}
    wait until page contains element     ${CustDataPage_Title}
    wait until page contains element     ${CustAttSection}
    wait until page contains element     ${CustAttTable}
    wait until page contains element     ${CustData_TR}
Verify Single filter is enabled for Customer Data
    Wait until page contains element     ${Single_filter_CustDataPageToggle}
    Element should be enabled            ${Single_filter_CustDataPageToggle}
Filter Customer Attribute by Single filters -Name
    [Arguments]     ${arg1}
    wait until page contains element    ${SelectFilter_CustDataPage}
    Click element    ${SelectFilter_CustDataPage}
    Press Keys       ${SelectFilter_CustDataPage}    Name    RETURN
    Sleep            2
    Input Text       ${SingleFilterByName_CustDataPage}        ${arg1}
    Click Element    ${Filter_button_CustDataPage}
    Sleep            2
    table should contain                  ${CustAttTable}               ${arg1}
Filter Customer Attribute by Single filters - Type
    wait until page contains element    ${SelectFilter_CustDataPage}
    Click element    ${SelectFilter_CustDataPage}
    Press Keys       ${SelectFilter_CustDataPage}    Type    RETURN
    Sleep            2
    Press Keys       ${CustAttType_filter}    Enum       RETURN
    Click Element    ${Filter_button_CustDataPage}
    Sleep            2
    table should contain                  ${CustAttTable}               Enum
Verify Advanced filter is enabled for Customer Data
    Wait until page contains element      ${Advanced_filterInactive_CustDataPage}
    click element                         ${Advanced_filterInactive_CustDataPage}
    Element should be enabled             ${Advanced_filterActive_CustDataPage}
    wait until page contains element      ${CustDataName_Advancedfilter}
    page should contain element           ${CustDataType_Advancedfilter}
    page should contain element           ${CustDataRequired_Advancedfilter}
Filter Customer Attribute by Advanced filters - Name
    [Arguments]     ${arg1}
    input text                            ${CustDataName_Advancedfilter}      ${arg1}
    click button                          ${Filter_button_CustDataPage}
    sleep                                 3
    Table Should Contain    ${CustAttTable}   ${arg1}
    Click Element        ${CustDataName_Advancedfilter}
    Press Keys           ${CustDataName_Advancedfilter}          CTRL+A+DELETE
Filter Customer Attribute by Advanced filters - Type
    Click Element                         ${CustDataType_Advancedfilter}
    Press Keys                            ${CustDataType_Advancedfilter}    DOWN+DOWN   RETURN
    sleep                                 3
    Table Should Contain                  ${CustAttTable}    Enum

Filter Customer Attribute by Advanced filters - Required
    input text                            ${CustDataRequired_Advancedfilter}     Yes
    click button                          ${Filter_button_CustDataPage}
    sleep                                 3
#    Table Should Contain                  ${CustAttTable}      Test
    Click Element        ${CustDataRequired_Advancedfilter}
    Press Keys           ${CustDataRequired_Advancedfilter}         CTRL+A+DELETE

Verify Customer data filtering
    [Arguments]     ${arg1}
#    ${count} =     Get Element Count      ${CustData_TR}
#    should be equal as integers           ${count}       ${1}
    table should contain                  ${CustAttTable}               ${arg1}
    table should contain                  ${CustAttTable}               Enum
Add new Customer Attribute
    wait until location is                ${CustDataPage_URL}
    click button                          ${AddCustAtt_Btn}
    wait until location is                ${CreateCustDataPage_URL}
Fill in Customer data
    [Arguments]     ${arg1}
    wait until page contains element      ${createcustdatapage_title}
    page should contain element           ${createcustatt_section}
    page should contain element           ${InputCustAttName}
    page should contain element           ${custatttype_select}
    page should contain element           ${hideatt_checkbox}
    input text                            ${InputCustAttName}           ${arg1}
    input text                            ${InputCustAttName}           ${arg1}
#    click element                         ${custatttype_select}
    press keys                            ${custatttype_select}         DOWN    RETURN
#    click element                         ${hideatt_checkbox}
    Press Keys                            ${Enum_InputField}        Test1111     RETURN
Remove mandatory Customer data
     [Arguments]     ${arg1}
    clear element text                    ${InputCustAttName}
    wait until page does not contain      ${arg1}
Create a Custom Attribute
    page should contain element           ${CreateUpdateCustAtt_Btn}
    click button                          ${CreateUpdateCustAtt_Btn}
Verify Customer Attribute is created
     [Arguments]     ${arg1}
    wait until location is                 ${CustDataPage_URL}
    wait until page contains               Successfully created customer attribute!
    Filter Customer Attribute By Single Filters -Name                             ${arg1}
Verify Customer Attribute is not created
    location should be                     ${CreateCustDataPage_URL}
    #wait until page contains element      ${requiredfield_alert}
    page should contain element            ${ThisFieldIsRequired}
Edit Customer Attribute by adding valid data
    wait until page contains element       ${editbtn_custatt}
    click element                          ${editbtn_custatt}
    wait until page contains element       ${EditCustDataPage_Title}
    wait until page contains element       ${editcustattsection}
    wait until page contains element       ${inputcustattname}
#    page should contain element            ${custatttype_select}
    page should contain element            ${CreateUpdateCustAtt_Btn}
    input text                             ${inputcustattname}                            ${Updated}
    click button                           ${CreateUpdateCustAtt_Btn}
Edit Customer Attribute by removing mandatory data
    wait until page contains element       ${editbtn_custatt}
    click element                          ${editbtn_custatt}
    wait until page contains element       ${EditCustDataPage_Title}
    wait until page contains element       ${editcustattsection}
    wait until page contains element       ${inputcustattname}
#    page should contain element            ${custatttype_select}
    page should contain element            ${RemoveType}
    page should contain element            ${CreateUpdateCustAtt_Btn}
    click element                          ${RemoveType}
    sleep      2
    #clear element text                    ${custatttype_select}
    click button                           ${CreateUpdateCustAtt_Btn}
Verify Customer Attribute is not updated
    page should contain element            ${EditCustAttSection}
    wait until page contains element       ${thisfieldisrequired}
    page should not contain element        ${SuccesfulUpdate_Msg}
Verify Customer Attribute is successfully updated
#    wait until page contains               ${SuccesfulUpdate_Msg}
    wait until location is                 ${CustDataPage_URL}
    wait until page contains element       ${custdatapage_title}
#    Verify Customer data filtering         ${Updated}
Choose Cancel when deleting a Customer attribute
    wait until page contains               ${Updated}
#    ${Count}      Get Element Count        ${CustData_TR}
#    ${DeleteUpdatedCustAttribute}   Catenate   SEPARATOR=	      ${DeleteBtn_CustAtt}  [     ${Count}     ]
    click element    ${DeleteBtn_CustAtt}
    wait until page contains element        ${Delete_Dialogue}
    wait until page contains element        ${CancelDelete_Btn}
    page should contain element             ${ConfirmDelete_Btn}
    click button                            ${CancelDelete_Btn}
Verify Customer attribute is not deleted
    location should be                      ${CustDataPage_URL}
    page should contain element             ${CustAttTable}
    table should contain                    ${CustAttTable}         ${Updated}
Choose Confirm when deleting a Customer attribute
    wait until page contains                ${Updated}
#    ${Count}      Get Element Count         ${CustData_TR}
#    ${DeleteUpdatedCustAttribute}   Catenate   SEPARATOR=	       ${DeleteBtn_CustAtt}  [     ${Count}     ]
#    click element    ${DeleteUpdatedCustAttribute}
    click element    ${DeleteBtn_CustAtt}
    wait until page contains element        ${Delete_Dialogue}
    wait until page contains element        ${CancelDelete_Btn}
    page should contain element             ${ConfirmDelete_Btn}
    click button                            ${ConfirmDelete_Btn}
Verify Customer attribute is deleted
    location should be                      ${CustDataPage_URL}
    wait until page contains element        ${Delete_Dialogue}
    page should contain element             ${CustAttTable}
    wait until page does not contain        ${Updated}





