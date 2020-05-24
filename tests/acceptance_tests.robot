*** Settings ***
Library  SeleniumLibrary
Library  PageObjectLibrary

Resource  ../resources/variables/variables.robot
Resource  ../resources/keywords/authentication_page_keywords.robot

Suite Setup  Open browser  ${ROOT}  ${BROWSER}
Suite Teardown  Close all browsers

*** Test Cases ***
No email
  [Tags]  gherkin  negative  acceptance test
  Given the user is on AuthenticationPage
  when user enters no email
  then error is shown that Invalid email address.

Invalid email
  [Tags]  gherkin  negative  acceptance test
  Given the user is on AuthenticationPage
  when user enters an invalid email
  then error is shown that Invalid email address.

valid and registered email
  [Tags]  gherkin  negative  acceptance test
  Given the user is on AuthenticationPage
  when user enters a valid and registered email
  then error is shown that An account using this email address has already been registered.

Valid and unregistered email with incorrect values on account creation page
  [Tags]  gherkin  negative  acceptance test
  Given the user is on AuthenticationPage
  when user enters a valid and unregistered email
  and user enter incorrect values in the account creation form
  then the error is shown shown

Valid and unregistered email
  [Tags]  gherkin  positive  acceptance test  happy path
  Given the user is on AuthenticationPage
  when user enters a valid and unregistered email
  and user enter correct values in the account creation form
  then the account is successfully registered