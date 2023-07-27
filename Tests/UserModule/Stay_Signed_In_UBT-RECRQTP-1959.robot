*** Settings ***
Documentation       Test cases of Sign Up Form for Company Users
Default Tags        Regression, Smoke, Sanity, UBT

Resource            ../../Resources/Common.robot
Resource            ../../Resources/Register-Company.robot

#Suite Setup         Begin Web Test
#Suite Teardown      End Web Test


*** Variables ***


*** Test Cases ***
#Company Registration
Scenario #1 RECRQTP-1960 Stay signed in - Happy Flow
    [Documentation]  Valid Input
    [Tags]           UBT

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login Admin Account
    #Step 3 Tick 'Stay signed in' checkbox
    Tick Stay Signed In
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    Wait Until Page Contains    Job List

    Execute Javascript      window.open('https://youtube.com','_self').close();
    PRESS KEYS      None   CTRL+T
    sleep  1

    Execute Javascript      window.open('https://secretproject1.com','_self').close();
    PRESS KEYS      None   CTRL+T
    Sleep  1
    Wait Until Page Contains    Job List
    Sleep  1
    Close All Browsers

