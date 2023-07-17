*** Settings ***
Library     SeleniumLibrary
Library     OperatingSystem
Resource    ../Common.robot
Variables   ../Elements/Register.py
Documentation       Register Key Words
Library             SeleniumLibrary
Variables           ../custom-library/environment.py
Variables           ../Elements/Register.py
Variables             ../../Resources/Elements/Register.py

*** Variables ***
${REG_URL}                          ${getBaseURL('${ENV}')}/register
${REG_CANDIDATE_URL}                ${getBaseURL('${ENV}')}/interviewee/register
${BROWSER}                          chrome

#Error messages
${emptyRequiredField}               This field is required.
${Invalid}                          !!!!a
${invalidEmail}                     This field must be a valid email.
${invalidPasswordLessThan8Chars}    The Password field must be at least 8 characters.
${invalidPasswordFormat}            Password must be at least 8 characters with a mix of small and uppercase letters, numbers and symbols.
${invalidCV}                        Please ensure you file is one of these fortmats: pdf., .doc, or .docx
${alreadyRegistered}                User already registered.

${maxLengthCompanyName}             The company name must not be greater than 100 characters.
${maxLengthName}                    The name must not be greater than 100 characters.
${maxLengthEmail}                   The email must not be greater than 100 characters.
${maxLengthPassword}                The password must not be greater than 50 characters.

${regCompanyName}                   PDW5 COMPANY
${regName}                          POPPY5
${regEmail}                         POPPY50@MAILINATOR.COM
${regPassword}                      !1Qazqaz

${chatmessage}                      Hello There! This is a sample chat message.

# Valid data for new company registration
${rregCompanyName}                  PhilHarmonic33 Co.
${rregName}                         Philip33
${rregEmail}                        Philip33@MAILINATOR.COM
${rregPassword}                     !1Qazqaz

# Valid data for new company registration for Show Password
${ShowPass-RegCompanyName}          MonicHarmonic4 Co.
${ShowPass-RegName}                 Monic4
${ShowPass-RegEmail}                Monic94@MAILINATOR.COM
${ShowPass-RegPassword}             !1Qazqaz

${CompanyNameMoreThanMaxLength}     ThisIsACompanyNameBeyondMaxLengthThisIsACompanyNameThisIsACompanyNameBeyondMaxLengthThisIsACompanyNam
${NameMoreThanMaxLenght}            ThisIaFullNameBeyondMaxLengthThisIaFullNameBeyondMaThisIaFullNameBeyondMaxLengthThisIaFullNameBeyondM
${EmailMoreThanMaxLength}           ThisIsEmailBeyondMaxLength9090909099ThisIsEmailBeyondMaxLength9090909099ThisIsEmailBey@mailinator.com
${PasswordMoreThanMaxLength}        !1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Q
${TelephoneMoreThanMaxLength}       639858968574858585858585858


*** Keywords ***

Verify Register Company Page is Loaded
    Wait Until Element is Visible       //*[@id="register-wrapper"]
Verify Register Applicant's Page is Loaded
    Wait Until Element is Visible       //*[@id="register-wrapper"]
Verify Successfull Registration Message
    Wait Until Page Contains            Successfully Sign Up
    Sleep   1
    Wait Until Page Contains            Verify your email

Check Registration Company Fields

#    Wait Until Element Is Visible       ${REG_COMPANY_NAME}
#    Wait Until Element Is Visible       ${REG_NAME}
#    Wait Until Element Is Visible       ${REG_EMAIL}
#    Wait Until Element Is Visible       ${REG_PASSWORD}
#    Wait Until Element Is Visible       ${REG_PRIVACY_POLICY}
#    Wait Until Element Is Visible       ${REG_CREATE_ACCOUNT}
#    Wait Until Element Is Visible       ${REG_VIEW_PASSWORD}

    Wait Until Element Is Visible       //*[@id="reg-company-name"]
    Wait Until Element Is Visible       //*[@id="reg-name"]
    Wait Until Element Is Visible       //*[@id="reg-email"]
    Wait Until Element Is Visible       //*[@id="reg-password"]
#    Wait Until Element Is Visible       //*[@id="reg-privacy-policy"]
    Wait Until Element Is Visible       //*[@id="reg-create-account"]
    Wait Until Element Is Visible       //*[@class="fa fa-eye-slash"]

Input Company Registration Form With Valid Data
    Input Text                          //*[@id="reg-company-name"]     ${rregCompanyName}
    Input Text                          //*[@id="reg-name"]             ${rregName}
    Input Text                          //*[@id="reg-email"]            ${rregEmail}
    Input Password                      //*[@id="reg-password"]         ${rregPassword}
Input Newly Registered Company Account
    Input Text                      //*[@id="login-email"]            ${rregEmail}
    input text                      //*[@id="login-password"]         ${rregPassword}

Click Create Account
#    Click Button                        ${REG_CREATE_ACCOUNT}
    Click Element                       //*[@id="reg-create-account"]
Click Privacy Policy Link to See Privacy Policy Page
    Click Link                          Privacy Policy
    Switch Window                       locator=NEW
    Page Should Contain                 Privacy Policy

Enable Privacy Policy
    Click Element                       //*[@for="reg-privacy-policy"]
Show Password
    Click Element                       //*[@id="reg-view-password"]
Show Password in Company Registration

    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account

#   Input Text                      ${REG_COMPANY_NAME}         ${regCompanyName}
#   Input Text                      ${REG_NAME}                 ${regName}
#   Input Text                      ${REG_EMAIL}                ${regEmail}
#   Input Password                  ${REG_PASSWORD}             ${regPassword}
    Input Text                      //*[@id="reg-company-name"]     ${regCompanyName}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${regEmail}
    Input Password                  //*[@id="reg-password"]         ${regPassword}
    Show Password

Send Message to Tawk Chat

 #   Wait Until Element Is Visible   //*[@class="tawk-custom-color tawk-custom-border-color tawk-button tawk-button-circle tawk-button-large"]
    click button                    //*[@class="tawk-min-chat-icon"]
    Input Text                      //*[@id="ltvfnc1s19081689579189159"]     ${rregName}
    Input Text                      //*[@id="dbdcmiapck81689579189160"]      ${rregEmail}
    Input Password                  //*[@id="yri0rlp7iacg1689579189160"]     ${chatmessage}
    Click Button                    //*[@class="tawk-margin-small-top tawk-button-hover width-100 tawk-custom-color tawk-custom-border-color tawk-button"]

Check required fields when empty: Company Name
#    ${emptyRequiredField}=  Get Text      ${REG_REQUIRED_FIELD_COMPANY_NAME}
    ${emptyRequiredField}=  Get Text    //*[@id="reg-company-name-invalid-feedback"]
Check required fields when empty: Name
#    ${emptyRequiredField}=  Get Text      ${REG_REQUIRED_FIELD_NAME}
    ${emptyRequiredField}=  Get Text    //*[@id="reg-name-invalid-feedback"]
Check required fields when empty: Email
#    Wait Until Element is Visible       ${REG_REQUIRED_FIELD_EMAIL}
    ${emptyRequiredField}=  Get Text    //*[@id="reg-email-invalid-feedback"]
Check required fields when empty: Password
#    Wait Until Element is Visible       ${REG_REQUIRED_FIELD_PASSWORD}
    ${emptyRequiredField}=  Get Text    //*[@id="reg-password-invalid-feedback"]
Check required fields when empty: Privacy Policy
    ${emptyRequiredField}=  Get Text    //*[@class="invalid-feedback"]

Check Error Message for Fields Beyond Maximum Limit: Company Name
#   ${maxLengthCompanyName}=  Get Text       ${REG_COMPANY_NAME_MAX_LIMIT}
    ${maxLengthCompanyName}=  Get Text    //*[@id="reg-company-name-invalid-feedback"]
Check Error Message for Fields Beyond Maximum Limit: Name
#    ${maxLengthName}=  Get Text       ${REG_NAME_MAX_LIMIT}
    ${maxLengthName}=  Get Text    //*[@id="reg-name-invalid-feedback"]
Check Error Message for Fields Beyond Maximum Limit: Email
#   ${maxLengthEmail}=  Get Text       ${REG_EMAIL_MAX_LIMIT}
    ${maxLengthEmail}=  Get Text    //*[@id="reg-email-invalid-feedback"]
Check Error Message for Fields Beyond Maximum Limit: Password
#   ${maxLengthPassword}=  Get Text       ${REG_PASSWORD_MAX_LIMIT}
    ${maxLengthPassword}=  Get Text    //*[@id="reg-password-invalid-feedback"]

Check Error for Invalid Email
    ${invalidEmail}=    Get Text    //*[@id="reg-email-invalid-feedback"]
Check Error for Invalid Password
    ${invalidPasswordLessThan8Chars}=   Get Text    //*[@id="reg-password-invalid-feedback"]
Check Error for Invalid Password Format
    ${invalidPasswordFormat}=           Get Text    //*[@id="reg-password-invalid-feedback"]

Check Error Message for Existing Data
    Wait Until Element is Visible    Invalid email address.

Create New Company with Invalid Data on Email
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Input Text                      //*[@id="reg-company-name"]     ${regCompanyName}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${Invalid}
    Input Password                  //*[@id="reg-password"]         ${regPassword}
    Check Error for Invalid Email
    Close Browser

Create New Company with Invalid Password - Less than 8 characters
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Sleep  1
    Input Text                      //*[@id="reg-company-name"]     ${regCompanyName}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${regPassword}
    Input Password                  //*[@id="reg-password"]         ${Invalid}
    Check Error for Invalid Password
    Close Browser
Create New Company with Invalid Password Format
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Sleep  1
    Input Text                      //*[@id="reg-company-name"]     ${regCompanyName}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${regPassword}
    Input Password                  //*[@id="reg-password"]         ${Invalid}
    Check Error for Invalid Password Format
    Close Browser

Create New Company with Company Name Beyond Defined Maximum Length

    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account

    Input Text                      //*[@id="reg-company-name"]     ${companynamemorethanmaxlength}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${regEmail}
    Input Password                  //*[@id="reg-password"]         ${regPassword}
    Check Error Message for Fields Beyond Maximum Limit: Company Name
    Close Browser
Create New Company with Name Beyond Defined Maximum Length

    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account

    Input Text                      //*[@id="reg-company-name"]     ${regcompanyname}
    Input Text                      //*[@id="reg-name"]             ${namemorethanmaxlenght}
    Input Text                      //*[@id="reg-email"]            ${regEmail}
    Input Password                  //*[@id="reg-password"]         ${regPassword}
    Check Error Message for Fields Beyond Maximum Limit: Name
Create New Company with Email Beyond Defined Maximum Length

    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account

    Input Text                      //*[@id="reg-company-name"]     ${regcompanyname}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${emailmorethanmaxlength}
    Input Password                  //*[@id="reg-password"]         ${regPassword}
    Check Error Message for Fields Beyond Maximum Limit: Email
    Close Browser
Create New Company with Password Beyond Defined Maximum Length

    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account

    Input Text                      //*[@id="reg-company-name"]     ${regcompanyname}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${regEmail}
    Input Password                  //*[@id="reg-password"]         ${passwordmorethanmaxlength}
    Check Error Message for Fields Beyond Maximum Limit: Password
    Close Browser

Create New Company with Empty Email
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Input Text                      //*[@id="reg-company-name"]     ${regcompanyname}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Password                  //*[@id="reg-password"]         ${regPassword}
    Enable Privacy Policy
    Click Create Account
    Check Required Fields When Empty: Email
    Close Browser
Create New Company with Empty Password
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Input Text                      //*[@id="reg-company-name"]     ${regcompanyname}
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${regEmail}
    Enable Privacy Policy
    Click Create Account
    Check Required Fields When Empty: Password
    Close Browser
Create New Company with Empty Company Name
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Input Text                      //*[@id="reg-name"]             ${regName}
    Input Text                      //*[@id="reg-email"]            ${regEmail}
    Input Text                      //*[@id="reg-password"]         ${regPassword}
    Enable Privacy Policy
    Click Create Account
    Check Required Fields When Empty: Company Name
    Close Browser
Create New Company with Empty Name
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Input Text                      //*[@id="reg-company-name"]     ${regCompanyName}
    Input Text                      //*[@id="reg-email"]            ${regEmail}
    Input Text                      //*[@id="reg-password"]         ${regPassword}
    Click Create Account
    Enable Privacy Policy
    Check Required Fields When Empty: Name
    Close Browser

Create New Company with Valid Data
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account

#   Input Text                      ${REG_COMPANY_NAME}         ${regCompanyName}
#   Input Text                      ${REG_NAME}                 ${regName}
#   Input Text                      ${REG_EMAIL}                ${regEmail}
#   Input Password                  ${REG_PASSWORD}             ${regPassword}
    Input Text                      //*[@id="reg-company-name"]     ${rregCompanyName}
    Input Text                      //*[@id="reg-name"]             ${rregName}
    Input Text                      //*[@id="reg-email"]            ${rregEmail}
    Input Password                  //*[@id="reg-password"]         ${rregPassword}

    Enable Privacy Policy
    Click Create Account
    Verify Successfull Registration Message
Create New Company with Valid Data and Show Password
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account
    Input Text                      //*[@id="reg-company-name"]     ${ShowPass-RegCompanyName}
    Input Text                      //*[@id="reg-name"]             ${ShowPass-RegName}
    Input Text                      //*[@id="reg-email"]            ${ShowPass-RegEmail}
    Input Password                  //*[@id="reg-password"]         ${ShowPass-RegPassword}
    Show Password
    Enable Privacy Policy
    Click Create Account
    Wait Until Page Contains        Successfully Sign Up
    Sleep   1
    Wait Until Page Contains        Verify your email
Create New Company with Existing Data
    Open Browser                    ${REG_URL}             ${Browser}
    Wait Until Page Contains        Create a Company Account

#   Input Text                      ${REG_COMPANY_NAME}         ${regCompanyName}
#   Input Text                      ${REG_NAME}                 ${regName}
#   Input Text                      ${REG_EMAIL}                ${regEmail}
#   Input Password                  ${REG_PASSWORD}             ${regPassword}
    Input Text                      //*[@id="reg-company-name"]     ${rregCompanyName}
    Input Text                      //*[@id="reg-name"]             ${rregName}
    Input Text                      //*[@id="reg-email"]            ${rregEmail}
    Input Password                  //*[@id="reg-password"]         ${rregPassword}

    Enable Privacy Policy
    Click Create Account
    Wait Until Page Contains        Invalid email address




