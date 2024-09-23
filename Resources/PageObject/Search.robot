*** Settings ***
Library     SeleniumLibrary
Resource    ../../Keywords/CommonFunction.robot


*** Variables ***
# ElementObject
${txtSearchProduct}                                             //input[@class='gh-tb ui-autocomplete-input']
${selCategoryProduct}                                           //select[@class='gh-sb ']
${btnSearch}                                                    //input[@type='submit' and @class='btn btn-prim gh-spr']

${lblSearchResultProductName}                                   //h1[@class='srp-controls__count-heading']/span[@class='BOLD'][2]

${lblContentSearchResultProductItemTitle}                       //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/a/div[@class='s-item__title']/span/span[@class='BOLD']
${lblContentSearchResultProductItemSubTitle}                    //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__subtitle'][1]

${lblContentSearchResultProductItemPrice}                       //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[1]/span
${lblContentSearchResultProductItemAdditionalPrice}             //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[2]/span/span[@class='STRIKETHROUGH']
${lblContentSearchResultProductItemDiscount}                    //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[2]/span[@class='s-item__discount s-item__discount']/span
${lblContentSearchResultProductItemFormatBestOfferEnabled}      //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[2]/span
${lblContentSearchResultProductItemShippingLogisticsCost}       //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[3]/span
${lblContentSearchResultProductItemLocation}                    //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[4]/span
${lblContentSearchResultProductItemAuthorizedSeller}            //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[5]/span/span[@class='BOLD']
${lblContentSearchResultProductItemWatchCountTotal}             //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[6]/span/span[@class='BOLD']
${lblContentSearchResultProductItemOrnsdSpeo}                   //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']/div[@class='s-item__details clearfix']/div/div[7]/span/span/div
${lblContentSearchResultProductItemSellerInfo}                  //div[@class='srp-river-results clearfix']/ul/li[1]//div[@class='s-item__info clearfix']//div[@class='s-item__details-section--secondary']/span[2]//span[@class='s-item__seller-info-text']


*** Keywords ***
Product Via Search
    Wait Until Element Is Visible    ${txtSearchProduct}    60
    Wait Until Element Is Enabled    ${txtSearchProduct}    60

    # Get Data Product
    CommonFunction.Get Data Search Product

    # Fill TextField Search Product
    Input Text    ${txtSearchProduct}    ${strProductSearchName}

    # Select Option Category Product
    Select From List By Label    ${selCategoryProduct}    ${strProductSearchCategory}

    # Click Button Search Product
    Click Element    ${btnSearch}

    # Verify Page Load Complete
    Wait For Condition    return document.readyState == "complete"

    Wait Until Element Is Visible    ${lblSearchResultProductName}    60

    # Verify Texfield Search Product Filled
    Element Attribute Value Should Be    ${txtSearchProduct}    value    ${strProductSearchName}

    # Verify Category Product Selected
    ${strGetSelectedCategoryProduct}=    Get Selected List Label    ${selCategoryProduct}
    Should Be Equal    ${strGetSelectedCategoryProduct}    ${strProductSearchCategory}

    # Verify Title Result Search Product Matches
    Element Should Be Visible    ${lblSearchResultProductName}
    Element Text Should Be    ${lblSearchResultProductName}    ${strProductSearchName}
    ${strGetValSearchResultProductName}=    Get Text    ${lblSearchResultProductName}
    Should Be Equal    ${strGetValSearchResultProductName}    ${strProductSearchName}

Verify Product Via Search Item Product
    # Verify Title Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemTitle}
    Element Text Should Be    ${lblContentSearchResultProductItemTitle}    ${strProductItemCompleteName}

    # Verify SubTitle Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemSubTitle}
    Element Text Should Be    ${lblContentSearchResultProductItemSubTitle}    ${strProductItemSubtitle}

    # Verify Price Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemPrice}
    Element Text Should Be    ${lblContentSearchResultProductItemPrice}    ${strProductItemPrice}

    # Verify BestOffer Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemFormatBestOfferEnabled}
    Element Text Should Be    ${lblContentSearchResultProductItemFormatBestOfferEnabled}    ${strProductItemBestOffer}

    # Verify ShippingLogisticsCost Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemShippingLogisticsCost}
    Element Text Should Be
    ...    ${lblContentSearchResultProductItemShippingLogisticsCost}
    ...    ${strProductItemShippingLogisticsCost}

    # Verify ItemLocation Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemLocation}
    Element Text Should Be    ${lblContentSearchResultProductItemLocation}    ${strProductItemLocation}

    # Verify AuthorizedSeller Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemAuthorizedSeller}
    Element Text Should Be    ${lblContentSearchResultProductItemAuthorizedSeller}    ${strProductItemAuthorizedSeller}

    # Verify AuthorizedSeller Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemWatchCountTotal}
    Element Text Should Be    ${lblContentSearchResultProductItemWatchCountTotal}    ${strProductItemWatchCountTotal}

    # Verify OrnsdSpeo Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemOrnsdSpeo}
    Element Text Should Be    ${lblContentSearchResultProductItemOrnsdSpeo}    ${strProductItemOrnsdSpeo}

    # Verify SellerInfo Search Item Product
    Element Should Be Visible    ${lblContentSearchResultProductItemSellerInfo}
    Element Text Should Be    ${lblContentSearchResultProductItemSellerInfo}    ${strProductItemSellerInfo}
