*** Settings ***
Documentation       Test cases of Sign Up Form for Company Users
Default Tags        Regression, Smoke, Sanity, UBT

Resource            ../../Resources/Common.robot
Resource            ../../Resources/Register-Company.robot

Suite Setup         Begin Web Test
Suite Teardown      End Web Test


*** Variables ***


*** Test Cases ***
#Company Registration
Scenario #1 RECRQTP-37 Submenu & Sign out - Happy Flow
    [Documentation]  Valid Input
    [Tags]           UBT

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login Admin Account
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    Wait Until Page Contains Element        Job List
    #Step
    Click Profile Menu
    # See sub-menu Change Password
    See Change Password Option Is Visible
    # See sub-menu Sign Out
    See Sign Out Option Is Visible
    Close All Browsers

Scenario #2 RECRQTP-38 Submenu & Sign out - Sign out
    [Documentation]  Valid Input
    [Tags]           UBT    Smoke   Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login Recruiter Account
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    Wait Until Page Contains Element        Job List
    #Step
    Click Sign Out
    Verify Login Page is Loaded
    Close All Browsers