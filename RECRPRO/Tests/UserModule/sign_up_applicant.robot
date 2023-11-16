*** Settings ***
Documentation       Test cases of Sign Up Form for Applicants
Default Tags        Regression, Smoke, EVT, BVT, UBT

Resource            ../../Resources/Common.robot
Resource            ../../Resources/Register-Applicant.robot


Suite Setup         Begin Web Test
Suite Teardown      End Web Test


*** Variables ***


*** Test Cases ***
#Candidate Registration

Scenario #1: Empty all mandatory fields
    [Documentation]  Empty Fields
    [Tags]           EVT
    Navigate to Login Page
    Navigate to Register Page
    Verify Register Company Page is loaded

    Navigate to Applicant's page
    Sleep   1
    Verify Register Applicant's Page is Loaded
    Check Registration Candidates Fields
    Click Create Account
    Check required fields when empty: Applicant Name
    Check required fields when empty: Applicant Email
    Check required fields when empty: Applicant Password
    Check required fields when empty: Applicant Privacy Policy

Scenario #2 Create New Candidate with Invalid Data in Email Field  #Bug: RECRPRO-3328
    [Documentation]  Invalid Input
    [Tags]           EVT
    Create New Candidate with Invalid Data on Email Field

Scenario #3 Create New Candidate with Invalid Password Format on Password Field
    [Documentation]  Invalid Input
    [Tags]           EVT
    Create New Candidate with Invalid Password Format on Password Field

Scenario #4 Create New Candidate with Invalid Password Format on Password Field
    [Documentation]  Invalid Input
    [Tags]           EVT
    Create New Candidate with Invalid Password length on Password Field

Scenario #5 Create New Candidate with Name Beyond Max Length  #Bug: RECRPRO-3329
    [Documentation]  Valid Input
    [Tags]           BVT
    Create New Candidate with Name Beyond Defined Maximum Length

Scenario #6 Create New Candidate with Email Beyond Max Length  #Bug: RECRPRO-3329
    [Documentation]  Valid Input
    [Tags]           BVT
    Create New Candidate with Email Beyond Defined Maximum Length

Scenario #7 Create New Candidate with Password Beyond Max Length  #Bug: RECRPRO-3329
    [Documentation]  Valid Input
    [Tags]           BVT
    Create New Candidate with Password Beyond Defined Maximum Length

#Scenario # Create New Candidate with Telephone Beyond Max Length  #Not applicable

Scenario #8 Create New Candidate with Empty Email Field
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Candidate with Empty Email Field

Scenario #9 Create New Candidate with Empty Password Field
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Candidate with Empty Password Field

Scenario #10 Create New Candidate with Empty Name Field
    [Documentation]  Valid Input
    [Tags]           EVT
    Create New Candidate with Empty Name Field

#Scenario # Create New Candidate with Empty Telephone Field  #Not Applicable
#    [Documentation]  Valid Input
#    [Tags]           EVT
#    Create New Candidate with Empty Telephone Field
#
Scenario #11 Show Password in Candidate Registration
    [Documentation]  Valid Input
    [Tags]           UBT
    Show Password in Candidate Registration

Scenario #12 Create New Candidate with Valid Data
    [Documentation]  Valid Input
    [Tags]           UBT
    Create New Candidate with Valid Data

Scenario #13 Create New Candidate with Existing Data
    [Documentation]  Valid Input
    [Tags]           UBT
    Create New Candidate with Existing Data

