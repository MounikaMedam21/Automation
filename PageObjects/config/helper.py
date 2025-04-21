from selenium import webdriver # type: ignore
from webdriver_manager.chrome import ChromeDriverManager # type: ignore
from selenium.webdriver.chrome.service import Service # type: ignore
from selenium.webdriver.chrome.options import Options # type: ignore

def create_chrome_driver_with_profile():
    chrome_options = Options()
    chrome_options.add_argument("user-data-dir=C:/path/to/your/custom/profile")  # specify your Chrome profile
    driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()), options=chrome_options)
    return driver
