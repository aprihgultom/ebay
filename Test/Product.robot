*** Settings ***
Resource    ../Keywords/CommonFunction.robot
Resource    ../Resources/PageObject/Search.robot
Resource    ../Resources/PageObject/Category.robot


*** Test Cases ***
Product Via Category After Applying Multiple Filters
    [Documentation]    Scenario 1 : Access Product Via Category After Applying Multiple Filters
    [Tags]    regression
    CommonFunction.Open Browser Url
    Product Via Category
    Fill Pop Up Filter Product
    Verify Fill Pop Filter Product
    Verify Applied Filter Tags Result
    Close Browser

Access Product via Search
    [Documentation]    Scenario 2: Access Product via Search
    [Tags]    regression
    CommonFunction.Open Browser Url
    Product Via Search
    Verify Product Via Search Item Product
    Close Browser
