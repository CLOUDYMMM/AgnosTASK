# AgnosTASK Automation Project

A Robot Framework automation project for testing the Agnos Health AI Screening Dashboard web application.

---

## 📁 Project Structure & Description

| Path / File            | Description                                                                 |
|------------------------|-----------------------------------------------------------------------------|
| `demo.robot`           | Example Robot Framework test suite (for demo or template purposes)           |
| `Task1.robot`          | Main test suite containing automated test cases for the dashboard            |
| `requirements.txt`     | Python dependencies for running the tests                                   |
| `screenshots/`         | Folder where screenshots from test failures are saved                       |
| `*.png`                | Individual screenshot files captured during test runs                       |
| `*.html`               | Test result reports (e.g., `log.html`, `report.html`)                       |
| `*.xml`                | Robot Framework output files (e.g., `output.xml`)                           |
| `venv/`                | (Optional) Python virtual environment directory                             |

---

## 🛠️ Prerequisites

- **Python 3.7+** (https://www.python.org/downloads/)
- **Google Chrome browser** (https://www.google.com/chrome/)
- **ChromeDriver** (must match your Chrome version: https://sites.google.com/chromium.org/driver/)
- **pip** (Python package manager, comes with Python)
- **Git** (optional, for version control)

---

## 🚀 Setup Instructions

### 1. Clone the Repository
If you haven't already, clone this repository to your local machine:
```sh
git clone <your-repo-url>
cd AgnosTASK
```

### 2. Create & Activate a Virtual Environment (Recommended)
This keeps dependencies isolated from your system Python:
```sh
python -m venv venv
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
```

### 3. Install Python Dependencies
Install all required libraries using pip:
```sh
pip install -r requirements.txt
```

### 4. Install ChromeDriver
- Download the correct version of ChromeDriver for your Chrome browser from [here](https://sites.google.com/chromium.org/driver/).
- Extract and place the executable in a folder included in your system PATH, or in the project root directory.
- To check if it's installed correctly, run:
  ```sh
  chromedriver --version
  ```

---

## 🧪 Running the Tests

To execute the main test suite:
```sh
robot Task1.robot
```
- Test results will be generated as `log.html`, `report.html`, and `output.xml` in the project directory.
- Screenshots of failures will be saved in the `screenshots/` folder.

---

## 📝 Notes & Troubleshooting

- **Variables:** Update credentials, URLs, and other variables in `Task1.robot` as needed for your environment.
- **ChromeDriver Issues:** Ensure ChromeDriver and Chrome browser versions are compatible. If you see browser launch errors, update ChromeDriver.
- **Test Failures:** Check the `log.html` and screenshots for detailed error information.
- **Virtual Environment:** If you encounter import errors, make sure your virtual environment is activated.
- **Permissions:** On some systems, you may need to give execution permission to ChromeDriver:
  ```sh
  chmod +x chromedriver
  ```

---

## 📚 Additional Resources
- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)

---

If you have any questions or issues, please open an issue or contact the maintainer. 