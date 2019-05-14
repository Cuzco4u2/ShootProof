*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
Resource  ../Resources/Common.robot

*** Variables ***
${DELAY}          0
#XPATH locator for the bottonmost "Get Started" on the page
${GetStartedBottomButton}  xpath=//div[@id='try-free']//*[name()='a' and @class='btn btn-shootproof btn-shootproof-white google-ads-signup-tracking']

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Online Proofing Galleries for Photographers

Assert Get Started button exist at the button of the page
    Element Should Be Visible   ${GetStartedBottomButton}

Click on the Bottommost button on the page
    click Element   ${GetStartedBottomButton}

The Sign-Up page should open
    wait until page contains  Let’s get started

The Browser should close
    Common.End Web Test
