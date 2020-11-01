from appium.webdriver.common.touch_action import TouchAction
from selenium.common.exceptions import NoSuchElementException
import environment
import unittest
from appium import webdriver
from behave import Given, When, Then
from time import sleep
import traceback

#call emulator
@Given('User navigate to Calculator application')
def start(self):
    environment.driver.reset()
    sleep(10)#wait for app to load

@Then('User must see title with "{Title}"')
def title(self, Title):
    try:
        environment.driver.find_element_by_xpath("//android.view.View[@text='{}']".format(Title))
        #environment.screenshot_pass()
    except NoSuchElementException:
        #environment.screenshot_fail()
        assert False, "Dont see message"

@When('User press first number with "{number1}"')
def fill_usernames(self, number1):
    try:
        #temp = tuple(number1)
        for i in number1:
            if i == '0':
                user = environment.driver.find_element_by_xpath("//*[@text='O']")
                user.click()
            else:
                user = environment.driver.find_element_by_xpath("//*[@text='{}']".format(i))
                user.click()
        #sleep(1)
        environment.screenshot_pass()
    except NoSuchElementException as e: #check locator exist or not
        #environment.screenshot_pass()
        assert False, "Could not find number1"

@When('User press "{symbol}" symbol')
def fill_usernames(self, symbol):
    try:
        user = environment.driver.find_element_by_xpath("//*[@text='{}']".format(symbol))
        user.click()
        sleep(1)
    # environment.screenshot_pass()
    except NoSuchElementException as e: #check locator exist or not
        #environment.screenshot_pass()
        assert False, "Could not find symbol"

@When('User press second number with "{number2}"')
def fill_usernames(self, number2):
    try:
        #temp = tuple(number2)
        for y in number2:
            if y == '0':
                user = environment.driver.find_element_by_xpath("//*[@text='O']")
                user.click()
            else:
                user = environment.driver.find_element_by_xpath("//*[@text='{}']".format(y))
                user.click()
        #sleep(1)
        environment.screenshot_pass()
    except NoSuchElementException as e: #check locator exist or not
        #environment.screenshot_pass()
        assert False, "Could not find number2"

@When('User press "{result}" button')
def fill_usernames(self, result):
    try:
        user = environment.driver.find_element_by_xpath("//*[@text='{}']".format(result))
        user.click()
        #sleep(1)
        environment.screenshot_pass()
    except NoSuchElementException as e: #check locator exist or not
        #environment.screenshot_pass()
        assert False, "Could not find result button"

@Then('User must see the result with "{message}"')
def title(self, message):
    try:
        environment.driver.find_element_by_xpath("//android.view.View[@text='{}']".format(message))
        #environment.screenshot_pass()
    except NoSuchElementException:
        #environment.screenshot_fail()
        assert False, "Dont see final result"