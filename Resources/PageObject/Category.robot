*** Settings ***
Library     SeleniumLibrary
Resource    ../../Keywords/CommonFunction.robot
Library     String


*** Variables ***
# ElementObject
${btnCategory}                          //button[@id='gh-shop-a']
${lblCategoryCellPhoneAccessories}      //div//table[@id='gh-sbc']//ul//li/a[text()='Cell phones & accessories']
${lblSideNavCellPhoneSmartphone}        //div[@class='dialog__cell']//ul//li/a[text()='Cell Phones & Smartphones']
${btnAllFilter}                         //button[text()='All Filters']
${popUpFilterCondition}                 //span[@class='x-overlay-aspect__label' and text()='Condition']
${popUpFilterConditionChcNew}           //label[@class='field__label field__label--end x-refine__multi-select-label']/span[text()='New']
${popUpFilterConditionChc}              //input[@id='c2-subPanel-LH_ItemCondition_New_cbx' and @type='checkbox']
${popUpFilterSelectedLabel}             //div[@class='x-tray__breadcrumbs']/span
${popUpFilterPrice}                     //span[@class='x-overlay-aspect__label' and text()='Price']
${popUpFilterTxtPriceFrom}              //input[@class='x-textrange__input x-textrange__input--from']
${popUpFilterTxtPriceTo}                //input[@class='x-textrange__input x-textrange__input--to']
${popUpFilterItemLocation}              //span[@class='x-overlay-aspect__label' and text()='Item Location']
${popUpFilterItemRadLocation}           //input[@name='location']
${popUpFilterItemRadLocationName}       location
${popUpFilterBtnApply}                  //div[@class='x-overlay-footer__apply']/button
${lblTitleFilterApplied}                //h1[@class='b-pageheader']/span[@class='b-pageheader__text']
${btnAppliedFilter}                     //li[@class='brm__item brm__item--applied']//button
${btnAppliedFilterResult}               //li[@class='brm__aspect-item brm__aspect-item--applied']/a


*** Keywords ***
Product Via Category
    Wait Until Element Is Visible    ${btnCategory}    60
    # Click Button Category
    Click Element    ${btnCategory}

    # Choose Category
    Wait Until Element Is Visible    ${lblCategoryCellPhoneAccessories}    60
    Click Element    ${lblCategoryCellPhoneAccessories}

    # Click Left Side Navigation
    Wait Until Element Is Visible    ${lblSideNavCellPhoneSmartphone}    60
    Click Element    ${lblSideNavCellPhoneSmartphone}

    # Click Button Filter
    Wait Until Element Is Visible    ${btnAllFilter}    60
    Click Element    ${btnAllFilter}

Fill Pop Up Filter Product
    # Get Data Category
    CommonFunction.Get Data Category Product

    # Filter Condition
    Wait Until Element Is Visible    ${popUpFilterCondition}    60
    Click Element    ${popUpFilterCondition}

    Wait Until Element Is Visible    ${popUpFilterConditionChcNew}    60
    Click Element    ${popUpFilterConditionChcNew}

    # Filter Price
    Wait Until Element Is Visible    ${popUpFilterPrice}    60
    Click Element    ${popUpFilterPrice}

    Wait Until Element Is Visible    ${popUpFilterTxtPriceFrom}    60
    Click Element    ${popUpFilterTxtPriceFrom}
    Input Text    ${popUpFilterTxtPriceFrom}    ${strPriceFrom}
    # Verify Textfield Price From Filled
    Element Attribute Value Should Be    ${popUpFilterTxtPriceFrom}    value    ${strPriceFrom}

    Wait Until Element Is Visible    ${popUpFilterTxtPriceFrom}    60
    Click Element    ${popUpFilterTxtPriceTo}
    Input Text    ${popUpFilterTxtPriceTo}    ${strPriceTo}
    # Verify Textfield Price To Filled
    Element Attribute Value Should Be    ${popUpFilterTxtPriceTo}    value    ${strPriceTo}

    # Filter Location
    Wait Until Element Is Visible    ${popUpFilterItemLocation}    60
    Click Element    ${popUpFilterItemLocation}

    Wait Until Element Is Enabled    ${popUpFilterItemRadLocation}    60
    Select Radio Button    ${popUpFilterItemRadLocationName}    ${strLocation}
    # Verify Radio Button Selected
    Radio Button Should Be Set To    ${popUpFilterItemRadLocationName}    ${strLocation}

Verify Fill Pop Filter Product
    # Verify Form Filter Filled or Selected

    # Condition
    ${lblObjPopUpFilterSelected}    Get VarObj PopUp Filter Selected    ${strCondition}
    Set Suite Variable    ${lblObjPopUpFilterSelected}
    Element Should Be Visible    ${lblObjPopUpFilterSelected}
    Element Text Should Be    ${lblObjPopUpFilterSelected}    ${strCondition}

    # Price
    ${lblObjPopUpFilterSelected}    Get VarObj PopUp Filter Selected    IDR${strPriceFrom} - IDR${strPriceTo}
    Set Suite Variable    ${lblObjPopUpFilterSelected}
    Element Should Be Visible    ${lblObjPopUpFilterSelected}
    Element Text Should Be    ${lblObjPopUpFilterSelected}    IDR${strPriceFrom} - IDR${strPriceTo}

    # Location
    ${lblObjPopUpFilterSelected}    Get VarObj PopUp Filter Selected    ${strLocation}
    Set Suite Variable    ${lblObjPopUpFilterSelected}
    Element Should Be Visible    ${lblObjPopUpFilterSelected}
    Element Text Should Be    ${lblObjPopUpFilterSelected}    ${strLocation}

    # Click Button Apply
    Click Element    ${popUpFilterBtnApply}

    # Verify Page Load Complete
    Wait For Condition    return document.readyState == "complete"

Verify Applied Filter Tags Result
    Wait Until Element Is Visible    ${btnAppliedFilter}    60

    # Convert Currency Format IDR
    ${strCurrIdrPriceFrom}    CommonFunction.Convert Currency Format    ${strPriceFrom}
    ${strCurrIdrPriceTo}    CommonFunction.Convert Currency Format    ${strPriceTo}

    # Verify Title Filter Applied
    Element Should Be Visible    ${lblTitleFilterApplied}
    Element Text Should Be
    ...    ${lblTitleFilterApplied}
    ...    ${strCategoryName} between IDR${strCurrIdrPriceFrom} and IDR${strCurrIdrPriceTo}

    # Click Button 3 Filter Applied
    Click Element    ${btnAppliedFilter}

    # Verify Applied Filter Result

    # Condition Filter
    ${strValFilterAppliedCondition}    Set Variable    Condition: ${strCondition}
    ${lblObjAppliedFilterResult}    Get VarObj Applied Filter Result    ${strValFilterAppliedCondition}
    Set Suite Variable    ${lblObjAppliedFilterResult}
    ${strGetAppliedFilterResultCondition}    Get Text    ${lblObjAppliedFilterResult}
    ${strAppliedFilterResultCondition}    Remove String    ${strGetAppliedFilterResultCondition}    filter applied
    ${strAppliedFilterResultCondition}    Convert To String    ${strAppliedFilterResultCondition}
    ${strAppliedFilterResultCondition}    Get Substring    ${strAppliedFilterResultCondition}    0    14

    Element Should Be Visible    ${lblObjAppliedFilterResult}

    # Verify String Value Matches
    Should Be Equal AS Strings    ${strAppliedFilterResultCondition}    ${strValFilterAppliedCondition}
    IF    '${strAppliedFilterResultCondition}' == '${strValFilterAppliedCondition}'
        Log To Console    Passed
    END

    # Price Filter
    # Convert Currency Format
    ${strCurrPriceFrom}    CommonFunction.Convert Currency Format    ${strPriceFrom}
    ${strCurrPriceTo}    CommonFunction.Convert Currency Format    ${strPriceTo}
    ${strValFilterAppliedPrice}    Set Variable    Price: $${strCurrPriceFrom} to $${strCurrPriceTo}

    ${lblObjAppliedFilterResult}    Get VarObj Applied Filter Result    ${strValFilterAppliedPrice}
    Set Suite Variable    ${lblObjAppliedFilterResult}
    ${strGetAppliedFilterResultPrice}    Get Text    ${lblObjAppliedFilterResult}
    ${strAppliedFilterResultPrice}    Remove String    ${strGetAppliedFilterResultPrice}    filter applied
    ${strAppliedFilterResultPrice}    Convert To String    ${strAppliedFilterResultPrice}
    ${strAppliedFilterResultPrice}    Get Substring    ${strAppliedFilterResultPrice}    0    37

    Element Should Be Visible    ${lblObjAppliedFilterResult}

    # Verify String Value Matches
    Should Be Equal AS Strings    ${strAppliedFilterResultPrice}    ${strValFilterAppliedPrice}
    IF    '${strAppliedFilterResultPrice}' == '${strValFilterAppliedPrice}'
        Log To Console    Passed
    END

    # Location Filter
    ${strValFilterAppliedItemLocation}    Set Variable    Item Location: ${strLocation}
    ${lblObjAppliedFilterResult}    Get VarObj Applied Filter Result    ${strValFilterAppliedItemLocation}
    Set Suite Variable    ${lblObjAppliedFilterResult}
    ${strGetAppliedFilterResultItemLocation}    Get Text    ${lblObjAppliedFilterResult}
    ${strAppliedFilterResultItemLocation}    Remove String
    ...    ${strGetAppliedFilterResultItemLocation}
    ...    filter applied
    ...    ${strGetAppliedFilterResultItemLocation}
    ...    filter applied
    ${strAppliedFilterResultItemLocation}    Convert To String    ${strAppliedFilterResultItemLocation}
    ${strAppliedFilterResultItemLocation}    Get Substring    ${strAppliedFilterResultItemLocation}    0    19

    Element Should Be Visible    ${lblObjAppliedFilterResult}

    # Verify String Value Matches
    Should Be Equal As Strings    ${strAppliedFilterResultItemLocation}    ${strValFilterAppliedItemLocation}
    IF    '${strAppliedFilterResultItemLocation}' == '${strValFilterAppliedItemLocation}'
        Log To Console    Passed
    END

Get VarObj PopUp Filter Selected
    [Arguments]    ${strFilterValue}
    ${lblObjPopUpFilterSelected}    Set Variable
    ...    //div[@class='x-tray__breadcrumbs']/span[text()='${strFilterValue}']
    RETURN    ${lblObjPopUpFilterSelected}

Get VarObj Applied Filter Result
    [Arguments]    ${strAppliedFilter}
    ${lblObjAppliedFilterResult}    Set Variable
    ...    //li[@class='brm__aspect-item brm__aspect-item--applied']/a/span[text()='${strAppliedFilter}']
    RETURN    ${lblObjAppliedFilterResult}
