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
Scenario #1 RECRQTP-13 Create account with empty fields
    [Documentation]  Empty Fields
    [Tags]           EVT, Regression
    #Step 1 Go to sign up page
    Navigate to Login Page
    Navigate to Register Page
    #Step 2 Given when the user leave all fields blank
    Check Registration Company Fields
    #Step 3 Click Create Account
    Click Create Account
    #See inline error message below each mandatory fields.
    Check required fields when empty: Company Name
    Check required fields when empty: Name
    Check required fields when empty: Email
    Check required fields when empty: Password
Scenario #2 RECRQTP-11 Sign Up - Input Validation - Empty Full Name
    [Documentation]  Empty Field
    [Tags]           EVT, Regression
    Create New Company with Empty Name
Scenario #3 RECRQTP-14 Sign Up - Input Validation - Empty Email
    [Documentation]  Empty Field
    [Tags]           EVT, Regression
    Create New Company with Empty Email
Scenario #4 RECRQTP-16 Sign Up - Input Validation - Invalid Format Email
    [Documentation]  Invalid Input
    [Tags]           EVT
    Create New Company with Invalid Data on Email
Scenario #5 RECRQTP-17 Sign Up - Input Validation - Empty Password
    [Documentation]  Empty Field
    [Tags]           EVT, Regression
    Create New Company with Empty Password
Scenario #6 RECRQTP-19 Sign Up - Input Validation - Invalid Format (Less than 8 characters) in Password
    [Documentation]  Invalid Input
    [Tags]           EVT, Regression
    Create New Company with Invalid Password - Less than 8 characters
Scenario #7 RECRQTP-1119 Sign Up - Input Validation - Empty Company Name
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Company with Empty Company Name
Scenario #8 RECRQTP-3216 Sign Up - Input Validation - Invalid Format (Less than 8 characters) in Password
    [Documentation]  Invalid Input
    [Tags]           EVT, Regression
    Create New Company with Invalid Password Format





