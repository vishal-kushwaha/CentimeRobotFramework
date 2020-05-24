from PageObjectLibrary import PageObject


class MyAccountPage(PageObject):
    PAGE_URL = "?controller=my-account"
    PAGE_TITLE = 'My Account - My Store'

    _locators = {
        "sign_out": "link:Sign out",
    }

    def sign_out(self):
        self.selib.click_element(self.locator.sign_out)
