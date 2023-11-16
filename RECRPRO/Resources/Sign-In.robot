*** Settings ***
Documentation       Common keyword
Library             SeleniumLibrary
Library             OperatingSystem
Variables           ../custom-library/environment.py
#Variables           elements/UserModule.py
#Variables           elements/CommonModule.py
Variables           ../Resources/Elements/Register.py

*** Variables ***
#Admin account
${email}                            PAULWYDINC22@MAILINATOR.COM
${password}                         !1Qazqaz
# Invalid credentials
${unregistered_email}               testunregistered999@mailinator.com
${invalid_email}                    PAULWYDINC22@MAILINATORCOM
${invalid_password}                 !
${EmailMoreThanMaxLength}           ThisIsEmailBeyondMaxLength9090909099ThisIsEmailBeyondMaxLength9090909099ThisIsEmailBey@mailinator.com
${PasswordMoreThanMaxLength}        !1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Qazqaz!1Q

#Error messages
${invalid_email_msg}                This field must be a valid email.
${emptyfield}                       This field is required.
${incorrect_credentials_msg}        Incorrect email address or password.

*** Keywords ***
Login With Email Beyond Max Length
    Input Text                      //*[@id="login-email"]            ${EmailMoreThanMaxLength}
    Input Text                      //*[@id="login-password"]         ${password}
Login With Password Beyond Max Length
    Input Text                      //*[@id="login-email"]            ${email}
    Input Text                      //*[@id="login-password"]         ${PasswordMoreThanMaxLength}
Login With Empty Password
    Input Text                      //*[@id="login-email"]            ${unregistered_email}
Login With Empty Email
    Input Text                      //*[@id="login-password"]         ${password}
Login With Unregistered Email
    Input Text                      //*[@id="login-email"]            ${unregistered_email}
    Input Text                      //*[@id="login-password"]         ${password}
Login With Invalid Email
    Input Text                      //*[@id="login-email"]            ${invalid_email}
    Input Text                      //*[@id="login-password"]         ${password}
Login Admin Account
    Input Text                      //*[@id="login-email"]            ${email}
    Input Text                      //*[@id="login-password"]         ${password}


Check Error for Invalid Email
    ${invalidEmail}=    Get Text    //*[@id="login-email-invalid-feedback"]

Check Error for Incorrect Credentials
    wait until page contains        Incorrect email address or password.

Check Error for Empty Email
    ${emptyfield}=    Get Text    //*[@id="login-email-invalid-feedback"]

Check Error for Empty Password
    ${emptyfield}=    Get Text    //*[@id="login-password-invalid-feedback"]