*** Settings ***
Library    SeleniumLibrary
Test Setup    Go To Test Site
Test Teardown    Close All Browsers

*** Variables ***
${URL}    https://robot-stage-1.firebaseapp.com
${BROWSER}    gc
${USERNAME}    demouser
${PASSWORD}    demopassword

*** Test Cases ***
After Login Should Redirect To Dashboard
    Click Element    go_to_slow_signin
    Input Text    inputUser    ${USERNAME}
    Input Password    inputPassword    ${PASSWORD}
    Click Element    buttonLogin
    Wait Until Keyword Succeeds    5s    1s    Location Should Be    ${URL}/dashboard.html

*** Keywords ***
Go To Test Site
    Open Browser    ${URL}    ${BROWSER}