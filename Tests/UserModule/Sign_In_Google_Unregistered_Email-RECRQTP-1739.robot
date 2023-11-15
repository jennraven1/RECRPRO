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
    Sign In With Google Using Unregistered Account
    Sleep  1
    Close All Browsers

