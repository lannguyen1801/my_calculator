from appium import webdriver
from time import sleep, strftime
#android
desired_caps = {
    'platformName' :'Android',
    'platformVersion' : '8.1',
    'automationName' : 'uiautomator1',
    'deviceName' : 'emulator-5554',
    'app':'D://CanThoUniversity//Thesis//my_calculator//build//app//outputs//flutter-apk//app-debug.apk'
}
driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)


#Take Screenshot

def screenshot_pass():
    st = strftime("%Y_%m_%d_%H%M%S") #avoid the same file name
    activityname = driver.current_activity
    filename = activityname+st
    driver.save_screenshot("D://ntnlan//Report//Report20_03082020//screenshot//pass//"+filename+".png")


def screenshot_fail():
    st = strftime("%Y_%m_%d_%H%M%S")
    activityname = driver.current_activity
    filename = activityname+st
    driver.save_screenshot("D://ntnlan//Report//Report20_03082020//screenshot//fail//"+filename+".png")

