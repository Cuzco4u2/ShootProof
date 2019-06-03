# The Robot Framework automation toolis pyhton-based, extensible keyword-driven automation for acceptance tesitng
# This ia change on the comment new - commit on 5/15
# This is a new review using upscale on 5/18 @ 5:30pm
#Woeking on the new branch Shoot1
*** Settings ***
#Library  SeleniumLibrary
#Documentation  This script opens dialer on phone
Library  AppiumLibrary
Library  Collections
Resource  ../Resources/Common.robot
Resource  ../Data/InputData.robot
Resource  ../Resources/Resource.robot


*** Variables ***
${url}  https://www.shootproof.com
${browser}  ie
#XPATH locator for the topmost "Get Started" on the page
${GetStartedTopButton}  xpath=//a[@class='btn btn-shootproof google-ads-signup-tracking']
#XPATH locator for the bottonmost "Get Started" on the page
${GetStartedBottomButton}  xpath=//div[@id='try-free']//*[name()='a' and @class='btn btn-shootproof btn-shootproof-white google-ads-signup-tracking']


${Device_name}  fd1bcffd
${Appium_server}  http://localhost:4723/wd/hub
${appPackage}  com.samsung.android.contacts
${appActivity}  com.android.dialer.DialtactsActivity
${platfrom}  7.0
${automationName}  uiautomator2
${androidbrowserpackage}  com.android.chrome
${appbrowserActivity}  com.google.android.apps.chrome.Main
${automationNameChrome}  Appium

*** Test Cases ***
#Test Case 1: Click on the topmost 'Get Started' button

Click_Top_Button_Get_Started
    [Tags]    Smoke  GetStarted  New
    Open Browser  ${url}    ${browser}
    maximize browser window
    Wait Until Element Is Visible   ${getstartedtopbutton}
    click Element   ${getstartedtopbutton}
    wait until page contains  Let’s get started
    close Browser

#Test Case 2: Click on the bottonmost 'Get Started' button
Click_Bottom_Button_Get_Started
    [Tags]    Smoke  GetStarted
    Open Browser  ${url}    ${browser}
    maximize browser window
    Wait until page contains  Professional sales tools and stunning client
    Title Should Be  Online Proofing Galleries for Photographers
    Wait Until Element Is Visible   ${getstartedbottombutton}
    click Element   ${getstartedbottombutton}
    wait until page contains  Let’s get started
    close Browser

#Test Case 3: click on the Bottommost 'Get Started' button using gherkin style
#using the common.robot, resource.robot and InputData.robot files to drive the automation
#This test case is executed using the keywords below

Valid_BottomMost_Get_Started
    Given browser is opened in homepage
    And I assert that a Get Started button exist at the button of the page
    When I click on the Bottommost button on the page
    Then the Sign-Up page should open
    And the browser should close

#APIUM
Open_Dialer
  setup and open dialer

Open_Browser
  setup and open browser

*** Keywords ***
#Running Test Case #3--> Valid BottomMost Get Started
Browser is opened in homepage
    Common.Begin Web Test
I assert that a Get Started button exist at the button of the page
    Resource.Assert Get Started button exist at the button of the page
I click on the Bottommost button on the page
    Resource.Click on the Bottommost button on the page
The Sign-Up page should open
    Resource.The Sign-Up page should open
The Browser should close
    Common.End Web Test

setup and open dialer
  ${androiddriver}=  Open Application  ${Appium_server}  platformName=android  platformVersion=${platfrom}  deviceName=${Device_name}  automationName=${automationName}
  ...  appPackage=${appPackage}  newCommandTimeout=2500  appActivity=${appActivity}

setup_and_open_browser
#   ${Options}    Create Dictionary    appPackage  ${androidbrowserpackage}
 #  ${Activity}  Create Dictionary   appActivity  ${appbrowserActivity}
 #   ${caps}    Create Dictionary    chromeOptions    ${Options}  ${Activity}
 #   Set to Dictionary    ${caps}    platformName    Android
 #   Set to Dictionary    ${caps}    platformVersion    ${platfrom}
 #   Set To Dictionary    ${caps}    deviceName    ${Device_name}
 #   Set To Dictionary    ${caps}    browserName    Chrome
 #   Create Webdriver    Remote    command_executor=http://localhost:4723/wd/hub    desired_capabilities=${caps}
   #${androiddriver}=
   Open Application  ${Appium_server}  platformName=android   platformVersion=${platfrom}  deviceName=${Device_name}  automationName=${automationNameChrome}
  ...  appPackage=${androidbrowserpackage}  appActivity=${appbrowserActivity}
    go to Url  http://www.shootproof.com
    Close Browser


 #Open Application    http://127.0.0.1:4723/wd/hub  platformName=Android  platformVersion=4.4.2  deviceName=42034dbac8074100  app=com.android.browser  automationName=appium  appPackage=com.android.browser  appActivity=com.google.android.apps.chrome.Main