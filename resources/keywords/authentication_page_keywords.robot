*** Keywords ***
the user is on AuthenticationPage
  Go to page  AuthenticationPage

user enters a valid and unregistered email
  Enter email  valid6@eaail.com
  Click create account button

user enter correct values in the account creation form
  Enter valid values in required fields
  Click register account button

the account is successfully registered
  the current page should be  MyAccountPage

user enters an invalid email
  Enter email  hello@world
  Click create account button  ${false}

error is shown that ${error}
  error is displayed on signup form  ${error}

user enters a valid and registered email
  Enter email  test@user.com
  Click create account button  ${false}

user enters no email
  Click create account button  ${false}


user enter incorrect values in the account creation form
  Enter valid values in required fields
  Enter personal info first name  12345
  Click register account button

the error is shown shown
  error is displayed on account creation form