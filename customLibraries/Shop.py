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
        # self.selLib.wait_until_element_is_visible("css:h4[class='card-title']", timeout=5)
        
        # productTitles = self.selLib.get_webelements("css:h4[class='card-title']")
        # print(f"Found {len(productTitles)} products on page")
        
        # index = 1
        # items_clicked = 0
        
        # # normalize product list
        # normalized_productsList = [item.strip().lower() for item in productsList]
        # print(f"Normalized productsList: {normalized_productsList}")
        
        # for productTitle in productTitles:
        #     page_item = productTitle.text.strip().lower()
        #     print(f"Comparing page item '{page_item}' to list {normalized_productsList}")
            
        #     if page_item in normalized_productsList:
        #         print(f"Clicking Add to Cart for {productTitle.text}")
        #         self.selLib.click_element(f"(//button[@class='btn btn-info'])[{index}]")
        #         items_clicked += 1
        #     index += 1

        # if items_clicked == 0:
        #     raise AssertionError("No matching products were added to cart — test should fail.")
        # else:
        #     print(f"Successfully clicked {items_clicked} products to add to cart.")


        index = 1
        producttitles = self.selLib.get_webelements("css:h4[class='card-title']")
        for productTitle in producttitles:
            if productTitle.text in productsList:
                self.selLib.click_element("xpath:(//button[@class='btn btn-info'])["+str(index)+"]")
            index += 1
        self.selLib.click_link("css:li.active a.nav-link.btn.btn-primary")

    @keyword
    def verify_items_in_checkout_page_and_proceed(self,productsList):
        rows = self.selLib.get_webelements("xpath://tr")
        total_rows = len(rows)

        items_in_checkout_page = []
        for item_no in range(1,total_rows-2):
            item = self.selLib.find_element(f"xpath:(//tr[{item_no}]/td[1]/div/div/h4/a)").text()
            items_in_checkout_page.append(item)

        print(f"Actual items in checkout page: {items_in_checkout_page}")
        print(f"Expected items :{productsList}")

        if productsList == items_in_checkout_page:
            print("Same Items Exist")
            self.selLib.click_element("xpath://button[@class='btn btn-success']")
        else:
            raise AssertionError("Items in checkout page do not match expected product list.")
