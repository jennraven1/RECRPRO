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
Scenario #1 RECRQTP-26 Sign In - Invalid email
    [Documentation]  Invalid Input
    [Tags]           EVT, Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login With Invalid Email
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    #Step 4 User cannot login in due to error.
    Check Error for Invalid Email
    Close All Browsers
Scenario #2 RECRQTP-27 Sign In - Unregistered email
    [Documentation]  Invalid Input
    [Tags]           EVT, Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login With Unregistered Email
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    #Step 4 User cannot login in due to error.
    Check Error for Incorrect Credentials
    Close All Browsers
Scenario #3 RECRQTP-29 Sign In - Empty email field
    [Documentation]  Empty Field/s
    [Tags]           EVT, Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login With Empty Email
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    #Step 4 User cannot login in due to error.
    Check Error for Empty Email
    Close All Browsers
Scenario #4 RECRQTP-30 Sign In - Empty password
    [Documentation]  Empty Field/s
    [Tags]           EVT, Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login With Empty Password
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    #Step 4 User cannot login in due to error.
    Check Error for Empty Password
    Close All Browsers