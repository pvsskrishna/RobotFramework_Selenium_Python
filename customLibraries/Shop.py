from robot.api.deco import library, keyword

@library
class Shop:
    #def __init__(self):
    # methods names will be converted to keyword name   Hello World

    @keyword
    def hello_world(self):
        print("hello")