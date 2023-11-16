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
Scenario #1 RECRQTP-798 Edit User Profile - Happy Flow
    [Documentation]  Valid Input
    [Tags]            UBT  Regression

    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Input valid email address and password
    Login Recruiter Account
    #Step 3 Click Login
    Click Sign In
    Sleep  1
    Wait Until Page Contains Element        Job List
    #Step
    Sleep  2
    Click Profile Menu
    Click Settings
    Sleep  2
    Verify User Profile Is Loaded
    Update Profile Picture
    Update FullName
    Click Save
    Close All Browsers