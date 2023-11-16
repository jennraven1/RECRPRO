*** Settings ***
Documentation       Register Applicant Key Words
Library             SeleniumLibrary
Library             OperatingSystem
#Resource            ../Resources/Common.robot
Variables           ../Resources/Elements/Register-Applicant.py
Variables           ../custom-library/environment.py

*** Variables ***

${REG_URL}                          ${getBaseURL('${ENV}')}/register
${REG_CANDIDATE_URL}                ${getBaseURL('${ENV}')}/interviewee/register
${BROWSER}                          chrome

${emptyRequiredField}               This field is required.

${Invalid}                          !!!!a
${invalidEmail}                     This field must be a valid email.

${invalidPasswordLessThan8Chars}    The Password field must be at least 8 characters.
${invalidPasswordFormat}            Password must be at least 8 characters with a mix of small and uppercase letters, numbers and symbols.

${invalidCV}                        Please ensure you file is one of these fortmats: pdf., .doc, or .docx
${alreadyRegistered}                User already registered.

${appName}                          Delvin F
${appEmail}                         Delvin03@MAILINATOR.COM
${appPassword}                      !1Qazqaz
${appPhoneNumber}                   639458796812

${maxLengthName}                    The name must not be greater than 100 characters.
${maxLengthEmail}                   The email must not be greater than 100 characters.
${maxLengthPassword}                The password must not be greater than 50 characters.
${maxLengthPhoneNumber}             The phone number must not be greater than xx digits.

${NameMoreThanMaxLenght}            ThisIaFullNameBeyondMaxLengthThisIaFullNameBeyondMaThisIaFullNameBeyondMaxLengthThisIaFullNameBeyondM
${EmailMoreThanMaxLength}           ThisIsEmailBeyondMaxLength9090909099ThisIsEmailBeyondMaxLength9090909099ThisIsEmailBey@mailinator.com
${PhoneNumberMoreThanMaxLength}     639858968574858585858585858
${PasswordMoreThanMaxLength}        !1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Q

${CVMoreThan5mb}
${CVInvalidFileType}

*** Keywords ***

Navigate to Applicant's page
    Click Link                          Register Here!

Verify Register Applicant's Page is Loaded
    Wait Until Element is Visible       //*[@id="reg-applicant-page"]

Check Registration Candidates Fields

#    Wait Until Element Is Visible       ${A_NAME}
#    Wait Until Element Is Visible       ${A_EMAIL}
#    Wait Until Element Is Visible       ${A_PASSWORD}
#    Wait Until Element Is Visible       ${A_PHONE_NUMBER}
#    Wait Until Element Is Visible       ${A_PRIVACY_POLICY}
#    Wait Until Element Is Visible       ${A_CREATE_ACCOUNT}
#    Wait Until Element Is Visible       ${A_VIEW_PASSWORD}
    Wait Until Element Is Visible       //*[@id="reg-applicant-name"]
    Wait Until Element Is Visible       //*[@id="reg-applicant-email"]
    Wait Until Element Is Visible       //*[@id="reg-applicant-password"]
    Wait Until Element Is Visible       //*[@id="reg-applicant-view-password"]
    Wait Until Element Is Visible       //*[@id="reg-applicant-phone-number"]
#    Wait Until Element Is Visible       //*[@id="reg-applicant-upload-cv"]
#    Wait Until Element Is Visible       //*[@id="reg-applicant-privacy-policy"]
    Wait Until Element Is Visible       //*[@id="reg-applicant-create-account"]

Click Create Account
#    Click Button                        ${A_CREATE_ACCOUNT}
    Click Button                         //*[@id="reg-applicant-create-account"]

Check required fields when empty: Applicant Name
#    Wait Until Element is Visible       ${A_NAME}
    ${emptyRequiredField}=              Get Text   //*[@id="reg-applicant-name-invalid-feedback"]

Check required fields when empty: Applicant Email
#    Wait Until Element is Visible       ${A_EMAIL}
    ${emptyRequiredField}=              Get Text   //*[@id="reg-applicant-email-invalid-feedback"]

Check required fields when empty: Applicant Password
#    Wait Until Element is Visible       ${A_PASSWORD}
    ${emptyRequiredField}=              Get Text  //*[@id="reg-applicant-password-invalid-feedback"]

Check required fields when empty: Applicant Privacy Policy
    ${emptyRequiredField}=              Get Text  //*[@id="reg-applicant-privacy-policy-invalid-feedback"]

Enable Privacy Policy
    Click Element                    //*[@for="reg-applicant-privacy-policy"]


Show Password
    Click Element                       //*[@id="reg-applicant-view-password"]

Check Error Message for Fields Beyond Maximum Limit: Name
    ${maxLengthName}=           Get Text   //*[@id="reg-applicant-name-invalid-feedback"]

Check Error Message for Fields Beyond Maximum Limit: Email
    ${maxLengthEmail}=          Get Text   //*[@id="reg-applicant-email-invalid-feedback"]

Check Error Message for Fields Beyond Maximum Limit: Password
    ${maxLengthPassword}=       Get Text  //*[@id="reg-applicant-password-invalid-feedback"]

Check Error Message for Fields Beyond Maximum Limit: Phone Number
    ${maxLengthPhoneNumber}=          Get Text   //*[@id="reg-applicant-phone-number-invalid-feedback"]

Check Error for Invalid Email
    ${invalidEmail}=                    Get Text   //*[@id="reg-applicant-email-invalid-feedback"]

Check Error for Invalid Password Format
    ${invalidPasswordFormat}=          Get Text   //*[@id="reg-applicant-password-invalid-feedback"]

Check Error for Password Less Than 8 Characters
    ${invalidPasswordLessThan8Chars}=  Get Text   //*[@id="reg-applicant-password-invalid-feedback"]

#Check Error Message for Existing Data
#    Wait Until Element is Visible   # RECRPRO-3313
#    ${alreadyRegistered}=              Get Text     //*[@class="notification"]

Upload Valid CV  #pending

Create New Candidate with Invalid Data on Email Field

#    ${regCompanyName}=             Generate Random String      8   [LETTERS]
#    ${regName}=                    Generate Random String      8   [LETTERS]
#    ${regEmail}=                   Generate Random String      8   [LETTERS]
#    ${regPassword}=                Generate Random String      8   [LETTERS]
#    ${regPrivacyPolicy}=           Generate Random String      8   [LETTERS]

    #Navigate to Create A Candidate Account
    Open Browser                        ${REG_CANDIDATE_URL}                    ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]           ${appName}
    Input Text                          //*[@id="reg-applicant-email"]          ${invalidEmail}
    Input Password                      //*[@id="reg-applicant-password"]       ${appPassword}
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}
    Enable Privacy Policy
    Click Create Account
    Check Error for Invalid Email
    Close Browser

Create New Candidate with Invalid Password Format on Password Field

    Open Browser                        ${REG_CANDIDATE_URL}                    ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]           ${appName}
    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
    Input Password                      //*[@id="reg-applicant-password"]       ${invalidPasswordFormat}
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}
    Enable Privacy Policy
    Click Create Account
    Check Error for Invalid Password Format
    Close Browser

Create New Candidate with Invalid Password length on Password Field

    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]        ${appName}
    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
    Input Password                      //*[@id="reg-applicant-password"]       ${invalidPasswordLessThan8Chars}
    Show Password
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}
    Enable Privacy Policy
    Click Create Account
    Check Error for Password Less Than 8 Characters
    Close Browser

Create New Candidate with Name Beyond Defined Maximum Length

    Open Browser                        ${REG_CANDIDATE_URL}                    ${Browser}
    Wait Until Page Contains            Create a Candidate Account
    Input Text                          //*[@id="reg-applicant-name"]        ${NameMoreThanMaxLenght}
    Check Error Message for Fields Beyond Maximum Limit: Name
    Close Browser

Create New Candidate with Email Beyond Defined Maximum Length

    Open Browser                        ${REG_CANDIDATE_URL}                    ${Browser}
    Wait Until Page Contains            Create a Candidate Account
    Input Text                          //*[@id="reg-applicant-email"]          ${emailmorethanmaxlength}
    Check Error Message for Fields Beyond Maximum Limit: Email
    Close Browser

Create New Candidate with Password Beyond Defined Maximum Length

    Open Browser                        ${REG_CANDIDATE_URL}                    ${Browser}
    Wait Until Page Contains            Create a Candidate Account
    Input Text                          //*[@id="reg-applicant-password"]       ${PasswordMoreThanMaxLength}
    Check Error Message for Fields Beyond Maximum Limit: Password
    Close Browser

Create New Candidate with Empty Email Field

    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]        ${appName}
    Input Password                      //*[@id="reg-applicant-password"]       ${appPassword}
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}

    Enable Privacy Policy
    Click Create Account
    Check required fields when empty: Applicant Email
    Close Browser

Create New Candidate with Empty Password Field

    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]        ${appName}
    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}

    Enable Privacy Policy
    Click Create Account
    Check required fields when empty: Applicant Password
    Close Browser

#Create New Candidate with Empty Telephone Field
#
#    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
#    Wait Until Page Contains            Create a Candidate Account
#
#    Input Text                          //*[@id="reg-applicant-name"]        ${appName}
#    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
#    Input Password                      //*[@id="reg-applicant-password"]       ${appPassword}
#
#    Enable Privacy Policy
#    Click Create Account
#    Check required fields when empty: Applicant Phone Number
#    Close Browser

Create New Candidate with Empty Name Field

    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
    Input Password                      //*[@id="reg-applicant-password"]       ${appPassword}
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}

    Enable Privacy Policy
    Click Create Account
    Check required fields when empty: Applicant Name
    Close Browser

Show Password in Candidate Registration

    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]        ${appName}
    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
    Input Password                      //*[@id="reg-applicant-password"]       ${appPassword}
    Show Password

Create New Candidate with Valid Data

    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]        ${appName}
    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
    Input Password                      //*[@id="reg-applicant-password"]       ${appPassword}
    Show Password
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}
    Enable Privacy Policy
    Click Create Account
    Sleep  1
    Wait Until Page Contains        Successfully Sign Up
    Sleep   1
    Wait Until Page Contains        Verify your email

Create New Candidate with Existing Data

    Open Browser                        ${REG_CANDIDATE_URL}             ${Browser}
    Wait Until Page Contains            Create a Candidate Account

    Input Text                          //*[@id="reg-applicant-name"]           ${appName}
    Input Text                          //*[@id="reg-applicant-email"]          ${appEmail}
    Input Password                      //*[@id="reg-applicant-password"]       ${appPassword}
    Show Password
    Input Text                          //*[@id="reg-applicant-phone-number"]   ${appPhoneNumber}
    Enable Privacy Policy
    Click Create Account
    Wait Until Page Contains            User already registered.
    Sleep  1
#    Check Error Message for Existing Data
    Close Browser