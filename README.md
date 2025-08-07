# Robot Framework Automation Suite

A full-featured test automation suite built using **Robot Framework**, applying the **Page Object Model (POM)**, **custom Python keywords**, **data-driven testing**, and **API testing** principles.

---

## 📚 Project Structure

```
RobotFramework/
├── PO/                         # Page Object Robot files
│   ├── LandingPage.robot
│   ├── ShopPage.robot
│   ├── CheckoutPage.robot
│   ├── ConfirmationPage.robot
│   └── Generic.robot
├── tests/                      # Test cases and reports
│   ├── testDemo1.robot         # Basic login test
│   ├── testDemo2.robot         # Optimized login + POM start
│   ├── testDemo3.robot         # Child window handling
│   ├── testDemo4.robot         # Template-based login testing
│   ├── testDemo5.robot         # Data-driven testing with CSV
│   ├── testDemo6.robot         # Custom Python keyword use
│   ├── testDemo7.robot         # Full E2E ecommerce scenario
│   └── testDemo8.robot         # API testing
├── customLibraries/            # Python-based custom keywords
│   └── Shop.py
├── notes/                      # Learning notes and documentation
│   ├── robotframework_keyword.txt
│   ├── Differences.txt
│   ├── Before_Reading_Notes.txt
│   ├── Section5_Data_Driven_Testing_and_Parameterization.txt
│   ├── Section5_Data_from_CSV_to_Robot_tests.txt
│   ├── Section6_Create_Custom_SeleniumKeywords_from_Python_Libraries.txt
│   ├── Section7_Implementing_PageObject_Design_Pattern_To_Organize_Robot_TestFiles.txt
│   ├── Section8_Parallel_Test_Execution_and_Reporting.txt
│   ├── Section9_Tagging_Filters_CICDJenkins.txt
│   └── Section10_API_Testing.txt
├── resources/                  # Shared data and drivers
│   ├── data.csv
│   ├── chromedriver.exe
│   ├── geckodriver.exe
│   └── msedgedriver.exe
└── README.md                   # Project documentation
```
<img width="627" height="478" alt="image" src="https://github.com/user-attachments/assets/dd2b36f2-eee9-41da-8ea2-9020545f8d61" />

---

## 🔍 Features Overview

- ✅ **Page Object Model (POM)** using modular `.robot` files per page
- ✅ **Data-Driven Testing** using both `Test Template` and external `.csv` files
- ✅ **Custom Python Keywords** integrated via `Shop.py`
- ✅ **API Testing** using `RequestsLibrary`
- ✅ **Parallel Execution** using `pabot`
- ✅ **Tagged Test Execution** via CLI (`--include`, `--exclude`)
- ✅ **CI/CD Ready** (Jenkins setup documented in notes)

---

## 🔧 Setup Instructions

### 1. Prerequisites

- Python >= 3.7
- pip installed

### 2. Install Dependencies

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
pip install robotframework-requests
pip install robotframework-datadriver
pip install robotframework-pabot
```

---

## 🔹 How to Run

### Run All Tests in Sequence:

```bash
robot tests/
```

### Run Tests in Parallel:

```bash
pabot tests/
```

### Run by Tag:

```bash
robot --include SMOKE tests/
```

### Run by Test Name (Partial Match):

```bash
robot -t "Valid*" tests/
```

### Pass Runtime Variables:

```bash
robot --variable browser_name:Firefox testDemo7.robot
```

---

## 🪤 Custom Python Library Example

Located at: `customLibraries/Shop.py`

```python
@keyword
def add_items_to_cart_and_checkout(self, productsList):
    ...

@keyword
def verify_items_in_checkout_page_and_proceed(self, productsList):
    ...
```

Use in Robot File:

```robot
Library    ../customLibraries/Shop.py
Add Items To Cart And Checkout    ${list_of_products}
```

---

## 📃 Notes & Learning

See `notes/` folder for:

- Robot syntax tips
- Differences between keywords
- How to implement POM
- Test data from CSV
- Custom keyword creation in Python
- Parallel testing with `pabot`
- Jenkins CI/CD integration
- Full API testing examples

---

## 🎨 Tags Used

You can group and filter tests using tags:

```robot
*** Test Cases ***
Validate Login
    [Tags]    SMOKE    REGRESSION
```

Then run:

```bash
robot --include SMOKE tests/
```

---

## 🚀 Sample End-to-End Flow (testDemo7.robot)

```robot
LandingPage.Fill the login form    ${valid_user_name}    ${valid_password}
handle chrome password manager popup
ShopPage.Verify the Card Titles in the Shop Page
Add Items To Cart And Checkout   ${list_of_products}
CheckoutPage.Verify Items In Checkout Page And Proceed    ${list_of_products}
ConfirmationPage.Enter The Country And Select Terms    ${country_name}
ConfirmationPage.Purchase The Product And Confirm The Message
```

---

## 

---

