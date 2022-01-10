*** Settings ***
Library        SeleniumLibrary    

Suite Setup            Log       I'm inside test suite setup
Suite Teardown         Log       I'm inside test suite teardown 
Test Setup             Log       I'm inside test setup
Test Teardown          Log       I'm inside test teardown

*** Variables ***
${URL}                https://opensource-demo.orangehrmlive.com/
${BROWSER}            Chrome
${WAIT_TIME}          3
@{CREDENTIALS}        Admin        admin123
&{LOGINDATA}          username=Admin        password=admin123

*** Keywords ***
LoginKW
    Input Text          id=txtUsername        ${CREDENTIALS}[0]
    Input Password      id=txtPassword        ${LOGINDATA}[password]
    Submit Form         //form[@id="frmLogin"]

InitialRoutineKW
    Open Browser        ${URL}        ${BROWSER}
    Set Browser Implicit Wait    ${WAIT_TIME}
    
LogsKW
    Log                 VarTest Complete by %{username} on %{os}
    Log                 Buidin Vars: ${CURDIR}, ${TEST NAME}, ${SUITE NAME}
    Close Browser

ExitKw
    Click Element       id=welcome
    Click Element       //a[contains(text(), "Logout")]

SleepKW
    Sleep               ${WAIT_TIME}
    
*** Test Cases ***
MyKeywordTest
    InitialRoutineKW
    LoginKW
    SleepKW
    Click Element       id=welcome
    SleepKW
    Click Element       //a[contains(text(), "Support")]
    SleepKW
    ExitKw
    LogsKW
