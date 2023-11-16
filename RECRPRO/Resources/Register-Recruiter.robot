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

${RecruiterEmail}                   recruiter10@mailinator.com
${RecruiterPwd}                     !1Qazqaz


*** Keywords ***

Log In as Recruiter
