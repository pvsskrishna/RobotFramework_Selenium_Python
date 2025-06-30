from robot.api.deco import library, keyword

@library
class Shop:
    #def __init__(self):
    # methods names will be converted to keyword name   Hello World

    @keyword
    def hello_world(self):
        print("hello")

    @keyword
    def add_items_to_cart_and_checkout(self, productsList):
        pass
        # @{elements}=    Get Webelements    ${Card_Titles}