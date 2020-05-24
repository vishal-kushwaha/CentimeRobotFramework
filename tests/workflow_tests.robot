*** Settings ***
Library  SeleniumLibrary
Library  PageObjectLibrary

Resource  ../resources/variables/variables.robot

Suite Setup  Open browser  ${ROOT}  ${BROWSER}
Suite Teardown  Close all browsers

Test Setup  Go to page  AuthenticationPage
Test Teardown  Sign out

*** Test Cases ***
Registration with valid data for required fields only
  [Documentation]  This test validates the registration workflow happy path by populating only the required fields in account creation form.
  [Tags]  positive  smoke  happy path
  Enter email  valid9@egsdfghiil.com
  Log  There is no mechanism available to delete account, hence a new email is needed for every run  WARN
  Click create account button
  Enter valid values in required fields
  Click register account button
  the current page should be  MyAccountPage


Registration with valid data for all fields
  [Documentation]  This test validates the registration workflow happy path with populating all the fields in account creation form.
  [Tags]  positive  smoke  happy path  all fields
  Enter email  valid9@eaasdfbil.com
  Log  There is no mechanism available to delete account, hence a new email is needed for every run  WARN
  Click create account button
  Enter valid values in all fields
  Click register account button
  the current page should be  MyAccountPage
