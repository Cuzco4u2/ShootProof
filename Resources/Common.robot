*** Settings ***
Documentation    Suite description
Library  Selenium2Library



*** Keywords ***
Begin Web Test
    Open Browser  ${LOGIN_URL}  ${BROWSERS}
    Maximize Browser Window

End Web Test
    Close All Browsers