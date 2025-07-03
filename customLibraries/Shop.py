from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("Seleniumlibrary")

    

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        # @{elements}=    Get Webelements    ${Card_Titles}
        index = 1
        productsTitles = self.selLib.get_webelements("css:h4[class='card-title']")
        for productTitle in productTitles:
            if productTitle.text in productsList:
                self.selLib.click_element("xpath:(//button[@class='btn btn-info'])["+str(index)+"]")
        