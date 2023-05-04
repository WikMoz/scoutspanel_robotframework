*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[@type='submit']//child::span[1]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${REMINDPASSWORDHYPERLINK}     xpath=//a[@tabindex='-1']
${PAGELOGO}        xpath=//div[3]/div[1]/div/div[1]


${PLAYERSTABLEURL}      https://scouts.futbolkolektyw.pl/pl/players
${PLAYERSBUTTON}        xpath=//ul[1]/div[2]/div[2]/span
${FILTERTABLEBUTTON}      xpath=//*[@data-testid = 'Filter Table-iconButton']
${FILTERNAME}     xpath=//div[1]/div/div/div/input
${FILTERSURNAME}      xpath=//div[2]/div/div/div/input
${FILTERMINAGE}       xpath=//div[3]/div/div/div/div[1]/div/input
${FILTERMAXAGE}       xpath=//div[3]/div/div/div/div[2]/div/input
${FILTERMAINPOSITION}     xpath=//div[4]/div/div/div/input
${FILTERCLUB}     xpath=//div[5]/div/div/div/input
${FILTERCLOSINGBUTTON}        xpath=//div[3]/button
${SEARCHEDNAME}       xpath=//td[1]/div[2]
${SEARCHEDSURNAME}      xpath=//td[2]/div[2]
${SEARCHEDAGE}      xpath=//td[3]/div[2]
${SEARCHEDMAINPOSITION}     xpath=//td[4]/div[2]
${SEARCHEDCLUB}     xpath=//td[5]/div[2]
${PLAYERCHOOSING}       xpath=//td[1]

*** Test Cases ***
Search a player at the players table
    Open login page
    Type In Email At The Login Page
    Type in password
    Click On The Sign In Button

    Click On The Players Button
    Click filter table button
    Type in name
    Type in surname
    Type in min age
    Type in max age
    Type in main position
    Type in club
    Click closing button
    Assert data in the players table
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

Click on the Players button
    Wait Until Element Is Visible   ${PLAYERSBUTTON}
    Click Element   ${PLAYERSBUTTON}
Click filter table button
    Wait Until Element Is Visible   ${FILTERTABLEBUTTON}
    Click Element    ${FILTERTABLEBUTTON}
Type in name
    Input Text     ${FILTERNAME}       Player 2
Type in surname
    Input Text  ${FILTERSURNAME}        Playerowski
Type in min age
    Input Text  ${FILTERMINAGE}     20
Type in max age
    Input Text  ${FILTERMAXAGE}     24
Type in main position
    Input Text  ${FILTERMAINPOSITION}       defender
Type in club
    Input Text  ${FILTERCLUB}       Wild Goats
Click closing button
    Click element   ${FILTERCLOSINGBUTTON}
Assert data in the players table
    Wait Until Element Contains     ${SEARCHEDNAME}     Player 2
    Element text should be  ${SEARCHEDNAME}     Player 2
    Element text should be  ${SEARCHEDSURNAME}  Playerowski
    Element text should be  ${SEARCHEDAGE}      23
    Element text should be  ${SEARCHEDMAINPOSITION}     defender
    Element text should be  ${SEARCHEDCLUB}     Wild Goats
