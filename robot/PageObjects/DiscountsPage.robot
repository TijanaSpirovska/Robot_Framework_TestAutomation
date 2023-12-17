*** Variables ***
# Discounts Page elements

${advancedNameInput}                    //input[@id="name"]
${createDiscountBtn}                    //button[@class="btn btn-light" and contains (.,"+ Add Discount")]

# Single filter names
${filterPriority}                       priority
${filterName}                           name
${filterType}                           type
${filterValue}                          value
${filterActiveFrom}                     active from
${filterActiveTo}                       active to

# Create Discount Page elements
${nameInput}                            //input[@name="name"]
${discountPriorityInput}                //input[@name="priority"]
${typesInput}                           //div[@class='select__single-value css-1uccc91-singleValue' ]
${percentageDropdown}                   Percentage
${absoluteDropdown}                     Absolute
${valueInput}                           //*[@id="n/a"]
${mockValue}                            5
${active_fromInput}                     //input[@name="active_from"]
${active_toInput}                       //input[@name="active_to"]
${newRuleBtn}                           //button[@class="mb-3 btn btn-primary btn-sm" and contains (., "+ New Rule")]
${clearBtn}                             //button[@class="mb-3 ml-2 btn btn-primary btn-sm" and contains (., "Clear")]

# Edit discount page
${editPageTitle}                        //*[@class="page-title" and contains(., "Edit discount")]

# Conditions/Rule
${selectField}                          (//div[@class=" css-ddqwys-control"])[2]
${inputSelectField}                     (//*[@id="rulesInputs"]//descendant::input[starts-with(@id,"react-select-")])[1]
${enterProductName}                     (//*[@id="rulesInputs"]//descendant::input[starts-with(@id,"react-select-")])[2]
${firstDropdownOption}                  //*[@id="react-select-36-option-0"]
${productQuantity}                      //*[@class="form-control form-control" and @placeholder="Enter product quantity"]
${deleteBtn}                            (//span[@class="flex items-center delete-btn"])[1]
${productNamesInputField}               //input[@id="react-select-19-input"]
${productNamesDropdownList}             //*[@class=" css-u69mgd-menu"]
${dropdown}                             //*[@class=" css-ddqwys-control"]

${Single_filter}                        //div[@class="switch-item active" and contains (.,"Single")]
${SelectFiter}                          //*[@id="singleSelectedFilterStatus"]
${NameFilter}                           //input[@placeholder="Filter by ... Name"]
${Filter_button}                       //button[@type='submit']
${PriorityFilter}                      //input[@placeholder="Filter by ... Priority"]
${TypeFilter}                          //div[@class='select__placeholder css-oefkzl-placeholder']
${ValueFilter}                         //input[@placeholder="Filter by ... Value"]
${Active_from_to}                      (//div[contains(@class, 'select__value-container select__value-container--has-value css-13t1v1n')])[2]
${Active_discount}                 //input[@type='text' and @placeholder='mm/dd/yyyy']
${Filter_Advanced}                //div[@class='switch-item active' and text()='Advanced']
${Advanced_filter_Discount}         //div[@class='switch-item' and text()='Advanced']
${FilterName_Advanced}                //input[@id='name']
${FilterPriority_Advanced}            //input[@id='priority']
${FilterType_Advanced}                (//div[@class="select__value-container select__value-container--has-value css-13t1v1n"])[1]

${FilterValue_Advanced}              //*[@id="value"]
${FilterActiveFrom_Advanced}            (//input[@placeholder='mm/dd/yyyy'])[1]
${FilterActiveTo_Advanced}             (//input[@placeholder='mm/dd/yyyy'])[2]
${FilterType_Advanced}                //div[@class="select__value-container css-13t1v1n"]/div[@class="select__placeholder css-oefkzl-placeholder"]
${ErrorMsg_Name}                       //div[@class='text-danger small' and text()='"name" is not allowed to be empty']
${ErrorMsg_Value}                     //div[@class='text-danger small' and text()='"value" is not allowed to be empty']
${ErrorMsg_Activefrom}                //small[text()='"Active from" contains an invalid value']
${ErrorMsg_Activeto}                  //small[text()='"Active to" contains an invalid value']
${ErrorMsg_Priority}                //div[@class='text-danger small' and text()='"priority" must be a number']
${ErrorMsg_Conditions}               //div[@id='rulesInputs']
${ActiveFrom_Discount}                03/22/2023
${ActiveTo_Discount}                  03/22/2025

