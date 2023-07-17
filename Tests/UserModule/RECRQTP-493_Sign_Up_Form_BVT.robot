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
Scenario #1 RECRQTP-12 Sign Up - Input Validation - More than max length in Full Name
    [Documentation]  Boundary Test
    [Tags]           BVT, Regression
    Create New Company with Name Beyond Defined Maximum Length

Scenario #2 RECRQTP-15 Sign Up - Input Validation - More than the max length in Email
    [Documentation]  Boundary Test
    [Tags]           BVT, Regression
    Create New Company with Email Beyond Defined Maximum Length

Scenario #3 RECRQTP-18 Sign Up - Input Validation - More than max length in Password
    [Documentation]  Boundary Test
    [Tags]           BVT, Regression
    Create New Company with Password Beyond Defined Maximum Length

Scenario #4 RECRQTP-3217 Sign Up - Input Validation - More than max length in Company Name
    [Documentation]  Boundary Test
    [Tags]           BVT, Regression
    Create New Company with Company Name Beyond Defined Maximum Length







