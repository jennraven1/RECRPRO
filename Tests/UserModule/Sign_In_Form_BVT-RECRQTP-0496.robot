*** Settings ***
Documentation       Test cases of Sign Up Form for Company Users
Default Tags        Regression, Smoke, Sanity, UBT

Resource            ../../Resources/Common.robot
Resource            ../../Resources/Sign-In.robot

Suite Setup         Begin Web Test
Suite Teardown      End Web Test


*** Variables ***


*** Test Cases ***
#Company Sign In
Scenario #1 RECRQTP-28 Sign In - More than max length of Email
    [Documentation]  Invalid Input
    [Tags]           EVT, Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login With Email Beyond Max Length
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    #Step 4 User cannot login in due to error.
    Check Error for Incorrect Credentials
    Close All Browsers
Scenario #1 REC2QTP-31 Sign In - More than max length of Password
    [Documentation]  Invalid Input
    [Tags]           EVT, Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login With Password Beyond Max Length
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    #Step 4 User cannot login in due to error.
    Check Error for Incorrect Credentials
    Close All Browsers