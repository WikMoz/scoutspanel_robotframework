*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[@type='submit']//child::span[1]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${REMINDPASSWORDHYPERLINK}     xpath=//a[@tabindex='-1']
${PAGELOGO}        xpath=//div[3]/div[1]/div/div[1]
${LOGLANGUAGEMENU}     xpath=//div[2]/div/div
${LOGPOLISHLANGUAGEOPTION}     xpath=//ul/li[1]
${LOGENGLISHLANGUAGEOPTION}        xpath=//ul/li[2]
${VALIDATION}       xpath=//div[3]/span
${PASSWORDTITLE}      xpath=//*[@id = 'password-label']
${REMINDPASSWORDTITLE}      xpath =//div/div[1]/a
${SIGNINBUTTONTITLE}        xpath=//button/span[1]


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]      Close Browser

Login to the system with invalid password
    Open login page
    Type in email
    Type in wrong password
    Click on the Submit button
    Assert validation
    [Teardown]      Close Browser

Choosing and checking language at the login page
    Open login page
    Click on the language menu
    Choose english language option
    Choose polish language option
    Assert polish language at the login page
    Choose english language option
    Assert English Language At The Login Page
    [Teardown]      Close Browser





*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Type in wrong password
    Input Text    ${PASSWORDINPUT}      1234
Click on the Submit button
    Click Element    ${SIGNINBUTTON}
Choose polish language option
    Click element   ${LOGPOLISHLANGUAGEOPTION}
Choose english language option
    Click element   ${LOGENGLISHLANGUAGEOPTION}
Assert polish language at the login page
    Element text should be  ${LOGLANGUAGEMENU}  Polski
    Element text should be  ${PASSWORDTITLE}  Hasło
    Element text should be  ${REMINDPASSWORDTITLE}  Przypomnij hasło
    Element text should be  ${SIGNINBUTTONTITLE}  ZALOGUJ
Assert english language at the login page
    Element text should be  ${LOGLANGUAGEMENU}  English
    Element text should be  ${PASSWORDTITLE}  Password
    Element text should be  ${REMINDPASSWORDTITLE}  Remind password
    Element text should be  ${SIGNINBUTTONTITLE}  SIGN IN
Assert dashboard
    Wait Until Element Is Visible    ${PAGELOGO}
    Title Should Be    Scouts panel
    Capture Page Screenshot    alert.png
Assert validation
    Wait Until Element Is Visible   ${VALIDATION}
    Element should contain     ${VALIDATION}        Identifier or password invalid.
Click on the language menu
    Click Element   ${LOGLANGUAGEMENU}

