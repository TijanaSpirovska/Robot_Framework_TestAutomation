*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary
Resource    ../PageObjects/VendorsPage.robot
Resource    ../Resources/Testdata.robot
Resource    ../PageObjects/MainPage.robot

*** Keywords ***
Go to Vendors Page
    Wait until page contains element     ${profilePicBtn}
    Click Button                         ${profilePicBtn}
    Click Link                           ${configurationLink}
    Location should be                   ${configurationUrlPath}
    Wait until page contains element     ${vendorsLink}
    Click Link                           ${vendorsLink}
    Location should be                   ${vendorsUrlPath}

Choose Random Vendor
    Wait until page contains element     ${table}
    ${elementCount}      Get Element Count        ${tableRow}
    ${randomNumberInRange}    Evaluate  random.randint(1, ${elementCount})
    ${randomEditXpathElement}    Catenate   SEPARATOR=	  ${editBtn}    [    ${randomNumberInRange}    ]
    Click element                         ${randomEditXpathElement}
    Wait Until Location Contains         ${vendorsUrlPath}/


Edit Vendor
    ${phoneVar}=                FakerLibrary.PhoneNumber
    ${emailVar}=                FakerLibrary.Email
    ${websiteVar}=              FakerLibrary.Url
    ${gl_accountVar}=           FakerLibrary.City
    ${categoryVar}=             FakerLibrary.Word
    ${descriptionVar}=          FakerLibrary.Paragraph

#Vendor info
    Input text                  ${phone}                    ${phoneVar}
    Input text                  ${email}                    ${emailVar}
    sleep    2
    Input text                  ${website}                  ${websiteVar}
    Input text                  ${gl_account}               ${gl_accountVar}
    Input text                  ${category}                 ${categoryVar}
    Input text                  ${description}              ${descriptionVar}
    sleep    5
    ${addressExists} =    Run Keyword And Return Status    Page Should Contain Element    ${addressType}
    Run Keyword If    ${addressExists}== False    Add Vendor Address
    Run Keyword If    ${addressExists}== True     Edit Vendor Address

    Click button                                ${updateBtn}
    Wait until location is                      ${vendorsUrlPath}
    Wait until page contains element            ${addVendorBtn}


#Vendor address
Add Vendor Address
    ${addressTypeVar}=                          FakerLibrary.Word
    ${addressNameVar}=                          FakerLibrary.StreetName
    ${buildingNumberVar}                        FakerLibrary.BuildingNumber
    ${zipCodeVar}                               FakerLibrary.Zipcode
    ${cityVar}                                  FakerLibrary.City
    ${stateVar}                                 FakerLibrary.State
    Click Button                                ${addVendorAddress}
    Wait until page contains element            ${addressType}
    Input text                                  ${addressType}              ${addressTypeVar}
    Input text                                  ${addressName}              ${addressNameVar}
    Input text                                  ${addressNumber}            ${buildingNumberVar}
    Input text                                  ${zipCode}                  ${zipCodeVar}
    Input text                                  ${city}                     ${cityVar}
    Input text                                  ${countryDropdown}          ${countryDropdownValue}
    press keys                                  ${state}                    ${stateVar}
    sleep    3

Edit Vendor Address
    ${addressTypeVar}=                          FakerLibrary.Word
    ${addressNameVar}=                          FakerLibrary.StreetName
    ${buildingNumberVar}                        FakerLibrary.BuildingNumber
    ${zipCodeVar}                               FakerLibrary.Zipcode
    ${cityVar}                                  FakerLibrary.City
    ${stateVar}                                 FakerLibrary.State
    Wait until page contains element            ${addressType}
#    Clear Element Text                          ${addressType}
#    Clear Element Text                          ${addressName}
#    Clear Element Text                          ${addressNumber}
#    Clear Element Text                          ${zipCode}
#    Clear Element Text                          ${city}
    Input text                                  ${addressType}              ${addressTypeVar}
    Input text                                  ${addressName}              ${addressNameVar}
    Input text                                  ${addressNumber}            ${buildingNumberVar}
    Input text                                  ${zipCode}                  ${zipCodeVar}
    Input text                                  ${city}                     ${cityVar}
    Press Keys                                  ${countryDropdown}          ${countryDropdownValue}
    Press Keys                                  ${state}                    ${stateVar}