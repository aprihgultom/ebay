*** Settings ***
Library     SeleniumLibrary
Library     JSONLibrary
Library     OperatingSystem
Library     Collections


*** Variables ***
# Value
${strUrl}               https://www.ebay.com/
${jsonDataProduct}      ${CURDIR}/../TestData/Product.json


*** Keywords ***
Open Browser Url
    Open Browser    ${strUrl}
    Maximize Browser Window

Get Data Search Product
    # Get data load json file
    ${dataFile}=    Get File    ${jsonDataProduct}
    ${dataFile}=    Evaluate    json.loads('''${dataFile}''')    json

    ${ProductSearchName}=    Get Value From Json    ${dataFile}    $.search.ProductSearchName
    ${strProductSearchName}=    Get From List    ${ProductSearchName}    0
    Set Test Variable    ${strProductSearchName}

    ${ProductSearchCategory}=    Get Value From Json    ${dataFile}    $.search.ProductSearchCategory
    ${strProductSearchCategory}=    Get From List    ${ProductSearchCategory}    0
    Set Test Variable    ${strProductSearchCategory}

    ${ProductItemCompleteName}=    Get Value From Json    ${dataFile}    $.search.ProductItemCompleteName
    ${strProductItemCompleteName}=    Get From List    ${ProductItemCompleteName}    0
    Set Test Variable    ${strProductItemCompleteName}

    ${ProductItemSubtitle}=    Get Value From Json    ${dataFile}    $.search.ProductItemSubtitle
    ${strProductItemSubtitle}=    Get From List    ${ProductItemSubtitle}    0
    Set Test Variable    ${strProductItemSubtitle}

    ${ProductItemPrice}=    Get Value From Json    ${dataFile}    $.search.ProductItemPrice
    ${strProductItemPrice}=    Get From List    ${ProductItemPrice}    0
    Set Test Variable    ${strProductItemPrice}

    ${ProductItemBestOffer}=    Get Value From Json    ${dataFile}    $.search.ProductItemBestOffer
    ${strProductItemBestOffer}=    Get From List    ${ProductItemBestOffer}    0
    Set Test Variable    ${strProductItemBestOffer}

    ${ProductItemShippingLogisticsCost}=    Get Value From Json
    ...    ${dataFile}
    ...    $.search.ProductItemShippingLogisticsCost
    ${strProductItemShippingLogisticsCost}=    Get From List    ${ProductItemShippingLogisticsCost}    0
    Set Test Variable    ${strProductItemShippingLogisticsCost}

    ${ProductItemLocation}=    Get Value From Json    ${dataFile}    $.search.ProductItemLocation
    ${strProductItemLocation}=    Get From List    ${ProductItemLocation}    0
    Set Test Variable    ${strProductItemLocation}

    ${ProductItemAuthorizedSeller}=    Get Value From Json    ${dataFile}    $.search.ProductItemAuthorizedSeller
    ${strProductItemAuthorizedSeller}=    Get From List    ${ProductItemAuthorizedSeller}    0
    Set Test Variable    ${strProductItemAuthorizedSeller}

    ${ProductItemWatchCountTotal}=    Get Value From Json    ${dataFile}    $.search.ProductItemWatchCountTotal
    ${strProductItemWatchCountTotal}=    Get From List    ${ProductItemWatchCountTotal}    0
    Set Test Variable    ${strProductItemWatchCountTotal}

    ${ProductItemOrnsdSpeo}=    Get Value From Json    ${dataFile}    $.search.ProductItemOrnsdSpeo
    ${strProductItemOrnsdSpeo}=    Get From List    ${ProductItemOrnsdSpeo}    0
    Set Test Variable    ${strProductItemOrnsdSpeo}

    # ${ProductItemSMEInfo}=    Get Value From Json    ${dataFile}    $.search.ProductItemSMEInfo
    # ${strProductItemSMEInfo}=    Get From List    ${ProductItemSMEInfo}    0
    # Set Test Variable    ${strProductItemSMEInfo}

    ${ProductItemSellerInfo}=    Get Value From Json    ${dataFile}    $.search.ProductItemSellerInfo
    ${strProductItemSellerInfo}=    Get From List    ${ProductItemSellerInfo}    0
    Set Test Variable    ${strProductItemSellerInfo}

Get Data Category Product
    # Get data load json file
    ${dataFile}=    Get File    ${jsonDataProduct}
    ${dataFile}=    Evaluate    json.loads('''${dataFile}''')    json

    ${CategoryName}=    Get Value From Json    ${dataFile}    $.category.CategoryName
    ${strCategoryName}=    Get From List    ${CategoryName}    0
    Set Test Variable    ${strCategoryName}

    ${Condition}=    Get Value From Json    ${dataFile}    $.category.Condition
    ${strCondition}=    Get From List    ${Condition}    0
    Set Test Variable    ${strCondition}

    ${PriceFrom}=    Get Value From Json    ${dataFile}    $.category.PriceFrom
    ${strPriceFrom}=    Get From List    ${PriceFrom}    0
    Set Test Variable    ${strPriceFrom}

    ${PriceTo}=    Get Value From Json    ${dataFile}    $.category.PriceTo
    ${strPriceTo}=    Get From List    ${PriceTo}    0
    Set Test Variable    ${strPriceTo}

    ${Location}=    Get Value From Json    ${dataFile}    $.category.Location
    ${strLocation}=    Get From List    ${Location}    0
    Set Test Variable    ${strLocation}

Convert Currency Format
    [Arguments]    ${strValPrice}
    ${valPrice}=    Evaluate    "{:,}".format(${strValPrice}).replace(',' , ',')
    ${currCStrValPrice}=    Convert To String    ${valPrice}
    ${strCurrValPrice}=    Set Variable    ${currCStrValPrice}.00
    Log    ${strCurrValPrice}
    RETURN    ${strCurrValPrice}
