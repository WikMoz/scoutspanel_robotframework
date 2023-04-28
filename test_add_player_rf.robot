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
${EMAILFIELD}     xpath=//div[2]/div/div[1]/div/div/input
${NAMEFIELD}     xpath=//div[2]/div/div[2]/div/div/input
${SURNAMEFIELD}     xpath=//div[2]/div/div[3]/div/div/input
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
${ADDYOUTUBELINK}     xpath=//div[19]/button/span[1]
${YOUTUBEFIELD}     xpath=//div[19]/div/div/div/input
${SUBMITBUTTON}     xpath=//div[3]/button[1]/span[1]
${EDITPLAYERTITLE}      xpath=//form/div[1]/div/span
${SAVINGPLAYERELEMENT}      xpath=//*[@id="3ycvesra3z"]

*** Test Cases ***
Add a player at the add player form
    Open login page
    Type In Email At The Login Page
    Type in password
    Click On The Sign In Button

    Click On The Add Player Button
    Type In Email At The Add Player Form
    Type In Name
    Type In Surname
    Type in phone
    Type in weight
    Type in height
    Type in date of birth
    Click on the leg select menu
    Click to choose right leg
    Type in club
    Type in level
    Type in main position
    Type in second position
    Click district select menu
    Click to choose Łódź district
    Type in achevements
    Click add language button
    Type in language 1
    Click add language button
    Type in language 2
    Click add youtube link button
    Type in youtube link
    Click submit button
    [Teardown]      Close Browser

*** Keywords ***
Open login page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email at the login page
    Input Text    ${EMAILINPUT}     user07@getnada.com
Type in password
    Input Text    ${PASSWORDINPUT}      Test-1234
Click on the Sign in button
    Click Element    ${SIGNINBUTTON}
Click on the Add Player button
    Wait Until Element Is Visible   ${ADDPLAYERBUTTON}
    Click Element   ${ADDPLAYERBUTTON}
Type in email at the add player form
    Wait Until Element Is Visible       ${EMAILFIELD}
    Input text  ${EMAILFIELD}       player1@gmail.com
Type in name
    Input text  ${NAMEFIELD}        Player
Type in surname
    Input text  ${SURNAMEFIELD}     Playerowski
Type in phone
    Input text  ${PHONEFIELD}       999999999
Type in weight
    Input text  ${WEIGHTFIELD}         80
Type in height
    Input text  ${HEIGHTFIELD}      190
Type in date of birth
    Input text  ${BIRTHDATEFIELD}    30.01.2000
Click on the leg select menu
    Click element   ${LEGSELECTMENU}
Click to choose right leg
    Wait Until Element Is Visible   ${RIGHTLEGOPTION}
    Click element   ${RIGHTLEGOPTION}
Type in club
    Input text  ${CLUBFIELD}     Wild Goats
Type in level
    Input text  ${LEVELFIELD}    junior
Type in main position
    Input text  ${MAINPOSITION}     defender
Type in second position
    Input text  ${SECONDPOSITION}    midfielder
Click district select menu
    Click element   ${DISTRICTSELECTMENU}
Click to choose Łódź district
    Wait Until Element Is visible   ${LODZDISTRICTOPTION}
    Set Browser Implicit Wait       2
    Click element   ${LODZDISTRICTOPTION}
Type in achevements
    Input text  ${ACHIEVEMENTFIELD}  winner of the Winners Cup, 3 goals in 10 seconds
Click add language button
    Click element   ${ADDLANGUAGEBUTTON}
Type in language 1
    Wait until element is visible   ${LANGUAGEFIELD}
    Input text  ${LANGUAGEFIELD}    english
Type in language 2
    Wait until element is visible   ${LANGUAGEFIELD}
    Input text  ${SECONDLANGUAGE}   japanese
Click add youtube link button
    Click element   ${ADDYOUTUBELINK}
Type in youtube link
    Wait until element is visible   ${YOUTUBEFIELD}
    Input text  ${YOUTUBEFIELD}  https://www.youtube.com/watch?v=gDgFXMKA6QU
Click submit button
    Click element   ${SUBMITBUTTON}







