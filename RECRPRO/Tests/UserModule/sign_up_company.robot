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
Scenario #1: Empty all mandatory fields
    [Documentation]  Empty Fields
    [Tags]           EVT
    Navigate to Login Page
    Navigate to Register Page
#    Open Company Register Page
#    Verify Register Page is Loaded
    Check Registration Company Fields
    Click Create Account
    Check required fields when empty: Company Name
    Check required fields when empty: Name
    Check required fields when empty: Email
    Check required fields when empty: Password

Scenario #2 Create New Company with Invalid Data in Email Field
    [Documentation]  Invalid Input
    [Tags]           EVT
    Create New Company with Invalid Data on Email Field

Scenario #3 Create New Company with Invalid Data on Password Field
    [Documentation]  Invalid Input
    [Tags]           EVT
    Create New Company with Invalid Data on Password Field

Scenario #4 Create New Company with Company Name Beyond Max Length
    [Documentation]  Valid Input
    [Tags]           BVT
    Create New Company with Company Name Beyond Defined Maximum Length

Scenario #5 Create New Company with Name Beyond Max Length
    [Documentation]  Valid Input
    [Tags]           BVT
    Create New Company with Name Beyond Defined Maximum Length

Scenario #6 Create New Company with Email Beyond Max Length
    [Documentation]  Valid Input
    [Tags]           BVT
    Create New Company with Email Beyond Defined Maximum Length

Scenario #7 Create New Company with Password Beyond Max Length
    [Documentation]  Valid Input
    [Tags]           BVT
    Create New Company with Password Beyond Defined Maximum Length

Scenario #8 Create New Company with Empty Email Field
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Company with Empty Email Field

Scenario #9 Create New Company with Empty Password Field
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Company with Empty Password Field

Scenario #10 Create New Company with Empty Company Name Field
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Company with Empty Company Name Field

Scenario #11 Create New Company with Empty Name Field
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Company with Empty Name Field

Scenario #12 Show Password in Company Registration
    [Documentation]  Valid Input
    [Tags]           UBT
    Show Password in Company Registration

Scenario #13 Create New Company with Valid Data
    [Documentation]  Valid Input
    [Tags]           UBT
    Create New Company with Valid Data

Scenario #14 Create New Company with Existing Data   #RECRPRO-3313
    [Documentation]  Valid Input
    [Tags]           UBT
    Create New Company with Existing Data


