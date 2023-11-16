*** Settings ***
Documentation       Test cases of Sign Up Form for Company Users
Default Tags        Regression, Smoke, EVT, BVT, UBT

Resource            ../../Resources/Common.robot
Resource            ../../Resources/Register-Company.robot

Suite Setup         Begin Web Test
Suite Teardown      End Web Test


*** Variables ***


*** Test Cases ***
#Company Registration
#Pending Scenario 2
Scenario #1 RECRQTP-1081 Sign Up - Eye icon
    [Documentation]  Valid Input - Show Password
    [Tags]           DBT    Regression
    #Step 1 Go to https://recruit.ravenstack.com/
    Navigate to Login Page
    #Step 2 Click the 'Register now' button.
    Navigate to Register Page
    Sleep   1
    Verify Register Company Page is loaded
    #Step 3  Fill out Company Name, Full Name, Work Email and Password.
    Input Company Registration Form With Valid Data
    #Step 4  Click the eye icon.
    Show Password
    #Step 5  Tick on ‘I agree with the Privacy Policy checkbox
    Enable Privacy Policy
    #Step 6 Click the ‘Create account’ button.
    Click Create Account
    Verify Successfull Registration Message
    #Step 7  Login using the registered email and password.
    Navigate to Login Page

    # User the verified account due to pending task of verify email
    Input Verified Company Account

    #Input Newly Registered Company Account
    Click Sign In
    Verify User Successfully Logged In
    Close All Browsers

Scenario #2 RECRQTP-1082 Sign Up - Privacy Policy link
   [Documentation]  Valid Input - Show Privacy Policy page
    [Tags]           DBT    Regression
    Navigate to Login Page
    #Step 2 Click the 'Register now' button.
    Navigate to Register Page
    Sleep   1
    Verify Register Company Page is loaded
    Click Privacy Policy Link to See Privacy Policy Page
