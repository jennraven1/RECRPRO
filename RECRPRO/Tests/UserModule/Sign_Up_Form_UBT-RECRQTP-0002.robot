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
Scenario #1 RECRQTP-10 Sign Up - Happy Flow
    [Documentation]  Valid Input
    [Tags]            UBT    Smoke   Regression
    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Click the 'Sign Up' button.
    Navigate to Register Page
    #Step 3  Click the eye icon.
    sleep   1
    Verify Register Company Page is loaded
    Show Password
    #Step 4  Fill out Company Name, Full Name, Work Email and Password.
    Input Company Registration Form With Valid Data
    Enable Privacy Policy
    #Step 5 Click the ‘Sign Up’ button.
    Click Create Account
    Verify Successfull Registration Message
    #Verify Email - Still pending
    #Step 6  Login using the registered email and password.
    Navigate to Login Page
    Input Newly Registered Company Account
    Click Sign In

    Verify User Successfully Logged In
    Close All Browsers
