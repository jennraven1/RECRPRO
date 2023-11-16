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
Scenario #1 RECRQTP-1736 Sign In with Google Accounts - Happy Flow
    [Documentation]  Valid Input
    [Tags]           UBT

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Sign In With Google
    Sleep  1
    Close All Browsers

Scenario #2 RECRQTP-1763 Sign in with Google Account - Already logged in to Google account
    [Documentation]  Valid Input
    [Tags]            UBT    Regression

    Log In To Google Account
    Sleep  2
    #Step 1 Go to https://recruit.ravenstack.com
    Open Project In New Tab and Close the rest
    #Step 2 Click Sign in with Google button
    Sign In With Google
    Sleep  5
    Wait Until Page Contains    Job List
    Sleep  1
    Close All Browsers