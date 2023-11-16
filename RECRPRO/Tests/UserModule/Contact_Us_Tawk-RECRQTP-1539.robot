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
Scenario #1 RECRQTP-1540 Contact us trigger tawk to - Happy Flow
    [Documentation]  Valid Input
    [Tags]           UBT, Regression
#    #Step 1 Go to https://recruit.ravenstack.com/
#    Navigate to Login Page
#    #Step 2 Click the 'Sign Up' button.
#    Navigate to Register Page
#    #Step 3  Click the eye icon.
#    sleep   1
#    Verify Register Company Page is loaded
#    Show Password
#    #Step 4  Fill out Company Name, Full Name, Work Email and Password.
#    Input Company Registration Form With Valid Data
#    Enable Privacy Policy
#    #Step 5 Click the ‘Sign Up’ button.
#    Click Create Account
#    Sleep  1
#    Verify Successfull Registration Message
#    #Step 6  Login using the registered email and password.
#    Click Link  Contact us.
#    Send Message to Tawk Chat
#    Close All Browsers
    Navigate to Login Page
    Sleep  1
    Send Message to Tawk Chat