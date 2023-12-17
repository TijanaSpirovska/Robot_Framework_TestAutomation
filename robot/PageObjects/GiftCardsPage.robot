*** Variables ***

${giftCPageTitle}                           //span[@class="page-title" and contains(.,"Gift Cards")]
${advancedNameInput}                        //input[@id="name"]
${createGiftCBtn}                           //button[@type='submit' and contains(@class, 'btn btn-light') and text()='+ Add Gift Card']


# Single filter names
${customerEmail}                            Customer email
${totalAmountField}                         Total amount
${redeemAmount}                             Redeem amount
${status}                                   Status
${filterValidFrom}                          Valid from
${filterValidTo}                            Valid to

# Advanced filter fields
${customerEmailFilterAd}                    //input[@id="customer_email"]
${TotalAmount_FilterAd}                    //input[@id="total_amount"]
${RedeemAmount_FilterAd}                   //input[@id="redeem_amount"]
${Validfrom_FilterAd}                      (//input[@type='text' and @placeholder='mm/dd/yyyy'])[1]
${ValitTo_FilterAd}                        (//input[@type='text' and @placeholder='mm/dd/yyyy'])[2]

# Create Gift Card Page elements
${createGiftCFormTitle}                     //h6[@class="section-title" and contains (., "1. Create Gift Card")]
${customerEmailField}                       //input[@name="customer_email"]
${giftCField}                               (//div[@class="form-group"]//descendant::input)[1]
${totalAmount}                              //input[@placeholder='Total amount...' and @type='number' ]
${validFrom}                                (//input[@type='text' and @placeholder='mm/dd/yyyy h:mm aa' ])[1]
${validTo}                                  (//input[@type='text' and @placeholder='mm/dd/yyyy h:mm aa' ])[2]
${giftCCheckValueField}                     //div[@class=" css-1uccc91-singleValue"]

${CustomerEmail_Filter}                     //input[@placeholder="Filter by ... Customer email"]
${TotalAmount_Filter}                       //input[@placeholder="Filter by ... Total amount"]
${RedeemAmount_Filter}                      //input[@placeholder="Filter by ... Redeem amount"]
${SelectStatus_Filter}                     //div[contains(@class, 'select__value-container css-13t1v1n')]
${ValidFrom_to_Filter}                        //input[@type='text' and @placeholder='mm/dd/yyyy']

${UpdateGiftCard_Msg}                     Successfully updated Gift Card data!
${CreateGiftCard_Msg}                     Successfully created gift card!
${DeleteGiftCard_Msg}                     Successfully deleted gift card!
${Select_checkbox}                        (//div[@class='checkbox-nice'])[2]
${MoreOptionsBtn}                         //button[@class='px-4 dropdown-toggle btn btn-primary']
${MoreOpt_ExportSelected}                 //a[@class='text-right dropdown-item' and text()='Export (selected)']
${MoreOpt_ExportAll}                      //a[@class='text-right dropdown-item' and text()='Export (all found)']
${deleteRowBtn}                            //span[@class="ml-1" and contains(.,"Delete")]
