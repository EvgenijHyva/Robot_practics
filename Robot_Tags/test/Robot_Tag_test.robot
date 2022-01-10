*** Settings ***
Library    SeleniumLibrary    

Suite Setup        Open Browser    ${url}    ${browser} 
Suite Teardown     Close Browser

Default Tags    sanity

*** Variables ***
${url}            https://google.com
${browser}        Chrome


*** Keywords ***
acceptKw
    Click Element  id=L2AGLb
WaitUntilLoadKW
    Set Browser Implicit Wait               5

*** Test Cases ***
TestTags1
    [Tags]         Smoke 
    Log            Test begin
    Sleep          1
    acceptKw
    Sleep          1
    
    
TestTags2
    Log            Test number 2
    WaitUntilLoadKW
    Input Text     name=q                Selenium TestTag 2
    Sleep          2  

TestTags3
    Log            Test number 3     
    WaitUntilLoadKW       
    Input Text     name=q                Selenium TestTag 3
    Sleep          3
    
