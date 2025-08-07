#  Jenkins CI/CD Setup for Robot Framework Automation

This guide explains how to set up **Jenkins CI/CD** to run your **Robot Framework** test cases — both from local workspace and GitHub repository — with support for parameterized builds, tags, and custom variables like browser selection.

---

## 🛠️ Jenkins Installation

1. **Download Jenkins WAR File**
   - Go to: https://www.jenkins.io/download/
   - Download: **Generic Java Package (.war)** (LTS version)

2. **Start Jenkins Locally**
   - Move `jenkins.war` to a safe directory (e.g., `C:\jenkins`)
   - Open Command Prompt and run:

     ```bash
     java -jar jenkins.war -httpPort=9090
     java -jar jenkins.war -httpPort=8080
     ```

   - If `java` is not recognized, install **JDK 11 or above** and add `JAVA_HOME/bin` to your system’s PATH.
   - After startup, copy the password shown in terminal logs and go to:
     ```
     http://localhost:8080
     ```

3. **Unlock Jenkins**
   - Paste the password shown in console logs or find it in:
     ```
     C:\Users\<your_username>\.jenkins\secrets\initialAdminPassword
     ```

4. **Finish setup and install suggested plugins**

---

## 📁 Jenkins Job Configuration

### 1. Create a New Job
- Click **“New Item”**
- Enter name: `robot-tests`
- Choose **Freestyle project**

---

### 2. Link Project Source
#### ✅ Option 1: Local Workspace
- Go to: `Advanced` in **General**
- Check **Use custom workspace**
- Provide absolute path to your Robot Framework project folder

#### ✅ Option 2: GitHub Repo
- In **Source Code Management**, choose `Git`
- Paste your repository URL

---

### 3. Add Build Step

- Go to **Build > Add Build Step > Execute Windows Batch Command**

Example command:
```
- cd tests
- robot testDemo6.robot
```
---
## 🔧 Include Tags & Variables in Build Step
### 1. To include a tag:
```
robot --include SMOKE tests
```
---
### 2. To override a variable like browser:
```
robot --variable browser_name:Firefox testDemo6.robot

```
---
## Make Jenkins Build Parameterized
**1. To make your builds flexible:**
   - In General tab, check: ✅ “This project is parameterized”
   - Click Add Parameter > Choose Choice Parameter
  
        | Parameter   | Example Values         |
        | ----------- | ---------------------- |
        | browserName | Chrome, Firefox, IE    |
        | Tags        | SMOKE, REGRESSION, API |

**2. Update your build step like this:**
```
cd tests
robot --variable browser_name:%browserName% --include %Tags% testDemo7.robot
```
- This allows dynamic selection of browser and test tags at runtime.

---
## 🎯 Sample Robot Commands Cheat Sheet
| Scenario                        | Command Example                                    |
| ------------------------------- | -------------------------------------------------- |
| Run all tests in folder         | `robot .`                                          |
| Run a specific test file        | `robot testDemo3.robot`                            |
| Run test by name                | `robot -t "Valid Login Test" .`                    |
| Run tests with tag              | `robot --include SMOKE .`                          |
| Run with multiple tags (AND/OR) | `robot --include "Regression AND SMOKE"`           |
| Rerun failed tests only         | `robot --rerunfailed output.xml .`                 |
| Merge results after rerun       | `rebot --merge output.xml rerun.xml`               |
| Override variable from CLI      | `robot --variable browser_name:Firefox test.robot` |

---
## ⚠️ Troubleshooting & Notes
- Ensure chromedriver, geckodriver, etc., are available in resources/ or added to system PATH.
- --variable must match your global variable name without ${}.
- For reusability, define default values in Generic.robot or a shared variable file.
---
## 📦 Optional Jenkins Plugins
 🧩 Robot Framework Plugin
- Publishes output.xml, report.html, log.html inside Jenkins UI.

 🧩 HTML Publisher Plugin
- Archives and displays custom HTML reports for better readability.
---
## 🙋 Interview Questions Cheat Sheet
1. How do you share variables between keywords?
→ Set Global Variable

2. How to override variables at runtime?
→ --variable name:value

3. How to run tests by tag or name?
→ --include, -t

4. How to pass parameters to Jenkins job?
→ Use Choice Parameter and %param% syntax

5. How to connect Python custom libraries?
→ BuiltIn().get_library_instance("SeleniumLibrary")

---

## ✅ Final Tips
- Always parameterize your Jenkins job to keep builds flexible and reusable
- Use meaningful tags (SMOKE, REGRESSION, API) to organize and filter tests
- Consider using pabot for parallel test execution to reduce time
---


# ▶️ How to Start or Run Jenkins Locally

This section explains how to download, run, and access Jenkins using the `.war` file method (without needing full installer setup).

---
## How to start Jenkins?

### 📦 Step 1: Download Jenkins WAR File

- Visit the official Jenkins website:  
  👉 [https://www.jenkins.io/download](https://www.jenkins.io/download)

- Scroll down to **Generic Java Package (.war)** under **LTS** version.
- Download the file: `jenkins.war`

---

### 📁 Step 2: Move WAR File to a Folder

- Create a dedicated directory (recommended):  
  Example: `C:\jenkins`

- Move the downloaded `jenkins.war` into that folder.

---

### ☕ Step 3: Make Sure Java is Installed

- Jenkins requires **Java JDK 11 or higher**.
- To check if Java is installed, run:

```bash
java -version
```

- If not recognized:
  1. Download Java from: [https://www.oracle.com/java/technologies/javase-downloads.html](https://www.oracle.com/java/technologies/javase-downloads.html)
  2. Install Java and add the `bin` path to **System Environment Variables > Path**:
     ```
     C:\Program Files\Java\jdk-XX\bin
     ```

---

### 🟢 Step 4: Start Jenkins

Open **Command Prompt** and navigate to the directory where `jenkins.war` is located.

```bash
cd C:\jenkins
java -jar jenkins.war -httpPort=9090
```

- Jenkins will launch and display logs.
- Wait for the message:  
  `"Jenkins is fully up and running"`

---

### 🔐 Step 5: Get Admin Password

Jenkins will prompt for an administrator password when you open the browser.

Copy the password shown in the command line or locate it manually:

```bash
C:\Users\<your-username>\.jenkins\secrets\initialAdminPassword
```

---

### 🌐 Step 6: Open Jenkins in Browser

Open the following URL:

```
http://localhost:9090
```

- Enter the admin password.
- Install **Suggested Plugins** when prompted.
- Create your admin user account and finish setup.

✅ Jenkins is now running locally and ready for use!
<img width="1919" height="874" alt="image" src="https://github.com/user-attachments/assets/7aa19a65-531c-4532-ae5f-3c63b4ed64df" />


---

### 🛑 How to Stop Jenkins

- Press `CTRL + C` in the command prompt to stop Jenkins manually.
- Or, simply close the terminal window.

---

### 🌀 Optional: Create a Batch File to Start Jenkins

To avoid typing the command every time:

1. Create a new file: `start-jenkins.bat`
2. Add this line inside:

```bat
java -jar jenkins.war -httpPort=9090
```

3. Save the file inside your Jenkins directory.
4. Double-click `start-jenkins.bat` to launch Jenkins next time.
   <img width="841" height="249" alt="image" src="https://github.com/user-attachments/assets/7a110f35-e8b2-45cd-b838-91ecb2508c50" />


---
### Console Output example:
<img width="1916" height="965" alt="image" src="https://github.com/user-attachments/assets/4aa64169-9f54-400e-9df8-cce39e0b29f6" />

## Log
- This is how a robot framework log html file look like after execution
<img width="1919" height="962" alt="image" src="https://github.com/user-attachments/assets/7c5ecd44-2c19-4e31-8842-ee1ba7f3c966" />

## Report 
- This is how a robot framework report html file look like after execution
<img width="1919" height="966" alt="image" src="https://github.com/user-attachments/assets/eac3a782-bd25-43d6-9f61-45cc4f18fb86" />

---




