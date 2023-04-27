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

${ADDAPLAYERURL}     https://scouts-test.futbolkolektyw.pl/en/players/add
${ADDPLAYERBUTTON}      xpath=//div/div/a/button/span[1]
${EMAILFIELD}     xpath=//div[1]/div/div/input
${NAMEFIELD}     xpath=//div[2]/div/div/input
${SURNAMEFIELD}     xpath=//div[3]/div/div/input
${PHONEFIELD}     xpath=//div[4]/div/div/input
${WEIGHTFIELD}     xpath=//div[5]/div/div/input
${HEIGHTFIELD}     xpath=//div[6]/div/div/input
${BIRTHDATEFIELD}     xpath=//div[7]/div/div/input
${LEGSELECTMENU}     xpath=//*[@id="mui-component-select-leg"]
${RIGHTLEGOPTION}     xpath=//*[@id='menu-leg']/div[3]/ul/li[1]
${LEFTLEGOPTION}     xpath=//*[@id='menu-leg']/div[3]/ul/li[2]
${CLUBFIELD}     xpath=//div[9]/div/div/input
${LEVELFIELD}     xpath=//div[10]/div/div/input
${MAINPOSITION}     xpath=//div[11]/div/div/input
${SECONDPOSITION}     xpath=//div[12]/div/div/input
${DISTRICTSELECTMENU}     xpath=//*[@id='mui-component-select-district']
${LODZDISTRICTOPTION}     xpath=//*[@data-value='lodzkie']
${ACHIEVEMENTFIELD}     xpath=//div[14]/div/div/input
${ADDLANGUAGEBUTTON}     xpath=//div[15]/button/span[1]
${LANGUAGEFIELD}     xpath=//div[15]/div/div/div/input
${SECONDLANGUAGE}     xpath=//div[15]/div[2]/div/div/input
${YOUTUBELINK}     xpath=//div[19]/button/span[1]
${YOUTUBEFIELD}     xpath=//*[@name='webYT[0]']
${SUBMITBUTTON}     xpath=//div[3]/button[1]/span[1]

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]      Close Browser


*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Sign in button
    Click Element    ${SIGNINBUTTON}
Click on the Add Player button
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}
    Click Element   ${ADDPLAYERBUTTON}
Type in email
    Input text
Type in name
    Input text
Type in surname
    Input text
Type in phone
    Input text
Type in weight
    Input text
Type in height
    Input text
Type in date of birth
    Input text
Click on the leg select menu
    Click element
Click to choose right leg
    Wait Until Element Is Visible
    Click element
Type in club
    Input text
Type in level
    Input text
Type in main position
    Input text
Type in second position
    Input text
Click district select menu
    Click element
Click to choose Łódź district
    Wait Until Element Is Visible
    Click element
Type in achevements
    Input text
Click add language button
    Click element
Type in language 1
    Wait until element is visible
    Input text
Click add language button
    Click element
Type in language 2
    Wait until element is visible
    Input text
Click add youtube link button
    Click element
Type in youtube link
    Wait until element is visible
    Input text


Assert values at the add player form
    Element text should be  ${NAMEFIELD}    Player 5
    Element text should be  ${
    Element text should be  ${
    Element text should be  ${






