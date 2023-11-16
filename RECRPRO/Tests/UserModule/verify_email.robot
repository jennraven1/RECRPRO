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

    Open Browser                        https://www.mailinator.com/                  ${Browser}
    Wait Until Page Contains Element    //*[@placeholder="Enter Public Mailinator Inbox"]
    Input Text                          //*[@placeholder="Enter Public Mailinator Inbox"]       JESSIE3@MAILINATOR.COM
    Press Keys                          //*[@placeholder="Enter Public Mailinator Inbox"]   ENTER
    Wait Until Page Contains            Public Message
    Click Element                       Verify your email to start posting a job on Raven Recruit
    Wait Until Page Contains            Email Verification
    Click Button                        Verify Email Address
    Wait Until Page Contains            Login to Your Account
    Input Text                          //*[@id="password"]                     !1Qazqaz
    Wait Until Page Contains            Job List
    Sleep   2
    Close All Browsers



