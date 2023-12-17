*** Variables ***
${Valid_Login_Email}            super.admin@iwcommerce.com
${Valid_Login_Password}         admin
${Wrong_Login_Email}            super.admin1234@iwcommerce.com
${Wrong_Login_Password}         4tgvdste4tretrt
${ErrorMsgText_LoginPage}       Please check you email or password!
${browser}                      chrome
${filter_name_data}=            Test135792468
${filter_category_data}=        jewelry
${filter_slug_data}=            ring
${filter_created_at_data}=      07/26/2022
${filter_updated_at_data}=      03/22/2023
${test_description}             Lorem Ipsum description
${Shipping_data}                Free Shipping
${mockTestCompanyName}          Test Company
${mockTestCompanyName2}         Test Company updated
${mockTestCompanyVat}           13
${mockTestDiscountName}         TestDiscount
${mockTestDiscountName2}        Test2Discount
${mockTestDiscountPriority}     2
${mockTestValue}                MKD
${mockTestRuleSearch}           Product with name and quantity
${mainUrl}                      https://iwcuat-admin.iwcommerce.com/
${companiesUrlPath}             https://iwcuat-admin.iwcommerce.com/companies
${createCompanyUrl}             https://iwcuat-admin.iwcommerce.com/companies/create
${CategoriesUrlPath}            https://iwcuat-admin.iwcommerce.com/categories         #Vale added this
${discountsUrlPath}             https://iwcuat-admin.iwcommerce.com/promotions/discounts
${createDiscountUrlPath}        https://iwcuat-admin.iwcommerce.com/promotions/discounts/create
${CreateCategoryUrlPath}        https://iwcuat-admin.iwcommerce.com/categories/create   #Vale added this
${EditCategoryUrlPath}          https://iwcuat-admin.iwcommerce.com/categories/         #Vale added this
${CustomersUrlPath}             https://iwcuat-admin.iwcommerce.com/customers           #Vale added this
${CreatecustomersUrlPath}       https://iwcuat-admin.iwcommerce.com/customers/create    #Vale added this
${taxProvidersUrl}              https://iwcuat-admin.iwcommerce.com/configuration/tax-providers
${systemTaxUrl}                 https://iwcuat-admin.iwcommerce.com/configuration/system-taxes
${createTaxUrl}                 https://iwcuat-admin.iwcommerce.com/configuration/system-taxes/create
${vendorsUrlPath}               https://iwcuat-admin.iwcommerce.com/configuration/vendors
${createVendorsUrlPath}         https://iwcuat-admin.iwcommerce.com/configuration/vendors/create
${tableIsEmpty}                 No data
${mock_test_phone}              +38971234567                                   #Vale added this
${mock_test_email}              valentina.palkovska+162@iwconnect.com          #Vale added this
${mock_test_address}            Farmcrest Ct                                   #Vale added this
${mock_test_addressNumber}      13450                                          #Vale added this
${mock_test_zipCode}            20171                                          #Vale added this
${mock_test_city}               Herndon                                        #Vale added this
${test_country}            United States of America (the)                 #Vale added this
${mock_test_state}              Virginia                                       #Vale added this
${mock_test_category}           Desktops                                       #Vale added this
${DeleteCateg_HoverText}        Can't delete category                          #Vale added this
${ActiveCategory_slug}          auto-test                                      #Vale added this
${InactiveCategory_slug}        autotest2                                      #Vale added this
${CustomerName_apendix}         Vale123                                        #Vale added this
${TestCustomerName}             AutoTest                                       #Vale added this
${couponGroupsUrlPath}          https://iwcuat-admin.iwcommerce.com/promotions/coupon-groups
${createCouponGroupUrlPath}     https://iwcuat-admin.iwcommerce.com/promotions/coupon-groups/create
${mockTestCouponGName}          Kupon13
${mockTestCouponGDesc}          This is a description by Bube.
${mockTestCouponGName2}           EditKupon
${mockTestEditCGDesc}           This is an edited description by Bube.
${CreateProductUrlPath}         https://iwcuat-admin.iwcommerce.com/products/create
${FedexWeight_data}             1.75
${FedexLength_data}             20
${FedexWidth_data}              5
${FedexHeight_data}             10
${InputCustomAttribute_data}    navy

#Gift Cards
${giftCardsUrlPath}             https://iwcuat-admin.iwcommerce.com/promotions/gift-cards
${giftCardsCreateUrlPath}       https://iwcuat-admin.iwcommerce.com/promotions/gift-cards/create
${giftCFieldValue}              100
${giftCFieldValue2}             150
${mockTestCustomerEmail}        eemail@email.com
${mockTestCustomerEmail2}       email@email.com



${ActiveFrom_date}              01112022
${ActiveTo_date}                01112032


${mock_user_email}              valetest@test.com
${mock_user_name}               valetest
${UserRole}                     Test vale
${UsersPage}                    https://iwcuat-admin.iwcommerce.com/configuration/users
${UserCreatePage}               https://iwcuat-admin.iwcommerce.com/configuration/users/create
${ImageExample}                 C:/Users/valentina.palkovska/Desktop/Ecommerce/E-commerce screenshots/fatboy slim.jpg
${General_ProdctType}           General
${VAT_TaxType}                  VAT
${ProductAttribute}       Model
${Dollar_Currency}              US Dollar
${No_data}                      No data
${OriginalPhotoValidation}      //img[@title="View original photo"]
${RolesPermissionsPage_URL}     https://iwcuat-admin.iwcommerce.com/configuration/roles-and-permissions
${SuccessfullyCreatedRole}      Successfully created role!
${UserRole_MockName}            Autmated test

${countryDropdownValue}         states

${taxName}                      Danok na Dodadena Vrednost
${taxName2}                     DDV2Vat
${descriptionTaxValue}          The fire on the altar must be kept burning; it must not go out
${descriptionTaxValue2}         Every morning the priest is to add firewood and arrange the burnt offering on the fire and burn the fat of the fellowship offerings on it.


${EditedUserRoleName}           Edited
${SuperAdminRole}               Super admin
${DashboardPage_URL}            https://iwcuat-admin.iwcommerce.com/dashboard
${ConfigurationPage_URL}        https://iwcuat-admin.iwcommerce.com/configuration

${LanguagesPage_URL}            https://iwcuat-admin.iwcommerce.com/configuration/languages
${UpdLangMessage}               Successfully updated Configuration data!
${CantDelDefaultLang}           You can not delete the default language

${CurrenciesPage_URL}           https://iwcuat-admin.iwcommerce.com/configuration/currencies
${UpdCurrMessage}               Successfully updated configuration!
${CantDelDefaultCurr}           You can not delete the default currency

${CustDataPage_URL}             https://iwcuat-admin.iwcommerce.com/configuration/customer-attributes
${CreateCustDataPage_URL}       https://iwcuat-admin.iwcommerce.com/configuration/customer-attributes/create
${product_attdataname}          Test attribute
${Percentage_CustData}          Input
${Updated}                      Colors
${SuccesfulUpdate_Msg}          Successfully updated customer attribute!


${fedExKey}                     r0Npp6c3UykAFvYd
${fedExPassword}                ItHx2WFK5ndkBkt0BBcu1LHdJ
${fedExAccNr}                   510087500
${fedExMeterNr}                 119267091
${easyPostKey}                  EasyPostkey43o9534909

${taxJarAPIToken}               69a011aa985c1740599faaf1b8d7243d
${avalaraUsername}              avalaraBube
${avalaraPassword}              passpass
${accountId}                    bube321
${companyId}                    companyBela321
${taxpayerIdNr}                 bube235345
${vertexAPIToken}               Vertexmertex23425


${stripePublicKey}              pk_test_51H3a39FtvA8Hsruw2GOG4Kt9KrLlvfdZdsqq9ksDLSzRwOPrMg4eIvZcY3z3pOGeeclzSVXeUIl2DH2QBIIsokdt00vnINTJUQ
${stripeSecretKey}              sk_test_51H3a39FtvA8HsruwkhsMCq3eJk3oCJxG8SJfVhPRdjOSffnby83WGrMauKTTlOhpKByRjvhjeZP9iDkZSegJKjNK00VzdyaJV8

${squareAppId}                  sandbox-sq0idb-eYWbFbZQfPb9KFrXQK12jQ
${squareToken}                  EAAAEJEiAqw-ZHSIYqOjizk5s66goyJwP6BnbVbO1kxkob01XW_fbfOV5FmFm7rX
${squareLocation}               LF8ZRHVXTPRD0

${paypalClientId}               AfriCFWIv1-Ym2l8n1MUQdjeFPs7D3iawUxh6DkUAcod53VjkRLmx-3_SFe-cpMytVxkapONaz5jlRmF
${paypalClientSecret}           ENHeTxTFZDG_LDzWntbvE9CPdTTzX3qlNc7CMIpPNM1fDubgRx95kbWypVSvr188ZCl661cP1zx-WDlI

${ProdTypesPage_URL}            https://iwcuat-admin.iwcommerce.com/configuration/product/types
${Mock_ProductType}             Food
${SuccesfulUpdateConfig_Msg}    Successfully updated Configuration data!
${ProdPricesPage_URL}           https://iwcuat-admin.iwcommerce.com/configuration/product/prices
${ProdAttPage_URL}              https://iwcuat-admin.iwcommerce.com/configuration/product/attributes
${CreateProdAttPage_URL}        https://iwcuat-admin.iwcommerce.com/configuration/product/attributes/create
${SuccesfulUpdate_Msg2}         Successfully updated Attribute data!

${iwjwtUrl}                     https://iwjwt.iwcommerce.com/

${Orders_page}                  https://iwcuat-admin.iwcommerce.com/orders

${Successful_Invoice_message}   Invoice successfully generated!

${Invoice_url}                  https://iwinvoice.iwcommerce.com/storage/pdf/IWC

${mock_test_data}               Test135792468
${UpdateName_apendix}           Test
${Updated_mock_test_data}               Test135792468Test
${CategorrDelete_Dialog}        //div[contains (@class,"Modal")]
${ResetFilter}                 //button[@type="button" and contains(.,"Reset")]
${Spiner}                      //div[contains(@class,"spinner-border")]

${Role1}                       Product manager
${Role2}                       Marketing specialist

${Cust_FirstName}               Tijana
${Cust_LastName}                TijanaTest
${Cust_Phone}                   +123456789
${Cust_Email}                   tijana.test11@89test.com
${Cust_Username}                tijana.test11@89test.com
${SuccessfulUpdate_customer}    Successfully updated Customer data!
${SuccesfulDownload}            File successfully downloaded
${Cust_WrongEmail}              test

${Cust_Attribute}               New Customer Attribute
${DeleteCustomer_Msg}           Successfully deleted profile!
${test_Country}            United States of America (the)

${FlateRate_Amount}             0.5
${NewAttribute}                Color
${ValuePercentage}             10
${ImageExample1}             C:/Users/tijana.spirovska/Desktop/IWcommerce/beautiful-butterflies-of-the-usa.jpg
${Price_ProdVarriant}          100
${DeletedProduct_Msg}         Successfully deleted product!
${ImageExample2}              C:/Users/tijana.spirovska/Desktop/IWcommerce/download.jfif
${SuccesfulUpdate_Products}   Successfully updated Product data!
${Shipping_data1}              Flat rate
${Product_Name}                Red jeans
${Discount_Value}              10
${CreatedDiscount_Msg}       Successfully created discount!
${UpdateDiscount_Msg}          Successfully updated Discount data!
${DeleteDiscount_Msg}          Successfully deleted discount!
${Active_from}                 03/22/2023
${Active_to}                   03/22/2025
${GiftCard_email}              tijanaonboarding@test.com
${GiftCard_TotalAmount}           150

${NewUserRole}               Automated role
${mock_CouponGName}          Test Coupon Group
${mock_CouponGDesc}          Test Coupon Group description
${mock_CouponGName2}         Edited
${mock_EditCGDesc}           Edited Test Coupon Group description
${mock_CouponName1}          Test Automated Coupon
${mock_CouponName2}          Updated
${mock_CouponGNameInCoupon}  Test Automated Coupon Group
${Coupons_Url}               https://iwcuat-admin.iwcommerce.com/promotions/coupons
${CreateCoupon_Url}          https://iwcuat-admin.iwcommerce.com/promotions/coupons/create
${mock_CouponName3}          Standalone Automated Coupon
