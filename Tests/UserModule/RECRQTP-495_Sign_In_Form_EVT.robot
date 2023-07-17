*** Settings ***
Documentation       Test cases of Sign Up Form for Company Users
Default Tags        Regression, Smoke, Sanity, UBT

Resource            ../../Resources/Common.robot
Resource            ../../Resources/Sign-In.robot

Suite Setup         Begin Web Test
Suite Teardown      End Web Test


*** Variables ***


*** Test Cases ***
#Company Registration
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
    Wait Until Page Contains    Job List
    Close All Browsers
