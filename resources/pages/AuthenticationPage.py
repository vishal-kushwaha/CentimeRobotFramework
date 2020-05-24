from PageObjectLibrary import PageObject


class AuthenticationPage(PageObject):
    PAGE_URL = "?controller=authentication&back=my-account"
    PAGE_TITLE = "Login - My Store"

    _locators = {
        # locators on signup form
        # error
        'signup_form_error': 'xpath://div[@id="create_account_error"]//li',
        # required fields
        'email': 'id:email_create',
        # button
        'submit_create': 'id:SubmitCreate',

        # locators on account create form
        # form
        'account_creation_form': 'account-creation_form',
        # error
        'account_create_form_error': 'xpath://div[@class="alert alert-danger"]//li',
        # required fields
        'customer_firstname': 'id:customer_firstname',
        'customer_lastname': 'id:customer_lastname',
        'email_account_form': 'id:email',
        'password': 'id:passwd',
        'firstname': 'id:firstname',
        'lastname': 'id:lastname',
        'address1': 'id:address1',
        'city': 'id:city',
        'state': 'id:id_state',
        'postcode': 'id:postcode',
        'country': 'id:id_country',
        'mobile': 'id:phone_mobile',
        'alias': 'alias',
        # optional fields
        'radio_mr': 'id:id_gender1',
        'dob_day': 'id:days',
        'dob_month': 'id:months',
        'dob_year': 'id:years',
        'news_letter': 'id:newsletter',
        'optin': 'id:optin',
        'company': 'id:company',
        'address2': 'id:address2',
        'additional_info': 'id:other',
        'home_phone': 'id:phone',
        # button
        'submit_account': 'id:submitAccount',
    }

    def _enter_value(self, element, value):
        self.selib.clear_element_text(element)
        self.selib.input_text(element, value)

    def click_register_account_button(self):
        self.selib.click_element(self.locator.submit_account)

    def click_create_account_button(self, should_pass=True):
        self.selib.click_element(self.locator.submit_create)
        if should_pass:
            self.selib.wait_until_page_contains_element(self.locator.account_creation_form)

    def enter_email(self, email):
        self._enter_value(self.locator.email, email)

    def enter_personal_info_first_name(self, name):
        self._enter_value(self.locator.customer_firstname, name)

    def enter_personal_info_last_name(self, name):
        self._enter_value(self.locator.customer_lastname, name)

    def enter_personal_info_email(self, email):
        self._enter_value(self.locator.email_account_form, email)

    def enter_password(self, password):
        self._enter_value(self.locator.password, password)

    def enter_values_in_required_fields(self, first_name, last_name, email, password, firstname, lastname, address, city, state, postcode, country, mobile, alias):
        self.enter_personal_info_first_name(first_name)
        self.enter_personal_info_last_name(last_name)
        # self._enter_value(self.locator.customer_lastname, 'User')
        # Leaving the email field untouched so that value from previous form is used as is
        # self._enter_value(self.locator.password, '12345')
        self.enter_password(password)
        self._enter_value(self.locator.firstname, firstname)
        self._enter_value(self.locator.lastname, lastname)
        self._enter_value(self.locator.address1, address)
        self._enter_value(self.locator.city, city)
        self.selib.select_from_list_by_label(self.locator.state, state)
        self._enter_value(self.locator.postcode, postcode)
        self.selib.select_from_list_by_label(self.locator.country, country)
        self._enter_value(self.locator.mobile, mobile)
        self._enter_value(self.locator.alias, alias)

    def enter_valid_values_in_optional_fields(self):
        # todo user faker
        self.selib.click_element(self.locator.radio_mr)
        self.selib.select_from_list_by_value(self.locator.dob_day, '20')
        self.selib.select_from_list_by_value(self.locator.dob_month, '6')
        self.selib.select_from_list_by_value(self.locator.dob_year, '1983')
        self.selib.select_checkbox(self.locator.news_letter)
        self.selib.select_checkbox(self.locator.optin)
        self._enter_value(self.locator.company, 'Centime')
        self._enter_value(self.locator.company, 'HP SaaS')
        self._enter_value(self.locator.additional_info, 'This is Centime assignment')
        self._enter_value(self.locator.home_phone, '0987654321')

    def enter_valid_values_in_required_fields(self):
        # todo replace hardcoded data with faker
        self.enter_values_in_required_fields('Test', 'User', 'test123@456email.com', '12345', 'Test', 'User',
                                                   'fake street', 'face city', 'Wisconsin', '12345', 'United States',
                                                   '1234567890', 'test')

    def enter_valid_values_in_all_fields(self):
        self.enter_valid_values_in_required_fields()
        self.enter_valid_values_in_optional_fields()

    def error_is_displayed_on_account_creation_form(self, error_text=None):
        self.selib.wait_until_page_contains_element(self.locator.account_create_form_error)
        if error_text:
            self.selib.element_should_contain(self.locator.account_create_form_error, error_text)

    def error_is_displayed_on_signup_form(self, error_text):
        self.selib.wait_until_page_contains_element(self.locator.signup_form_error)
        self.selib.element_should_contain(self.locator.signup_form_error, error_text)
