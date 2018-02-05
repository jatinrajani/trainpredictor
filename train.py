from selenium import webdriver
from selenium.webdriver.support.ui import Select
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

browser=webdriver.Firefox() 
browser.get('https://enquiry.indianrail.gov.in/mntes/')


import csv

f = open('names2.csv', 'w')


fnames = ['trainNo', 'trainStatus']
writer = csv.DictWriter(f, fieldnames=fnames)  
writer.writeheader()
l=['12801','12802','12003','12451','12452','12033','12034','12011','12005','12045']
for i in l:
	browser.implicitly_wait(10)
	elem=browser.find_element_by_name('trainNo').send_keys(i,Keys.RETURN)
	browser.maximize_window() 
	browser.implicitly_wait(10)

	select=Select(browser.find_element_by_name('jStation'))
	index=(len(select.options))-1
	
	select.select_by_index(index)
	days=['jYesterday','jToday']
	for day in days:
		browser.find_element_by_name(day).click()
		browser.implicitly_wait(10)
		try:
   	    	   nodelay=browser.find_element_by_class_name('greenS11L')
   	    	   status=nodelay.text
		except:
	    	   delay=browser.find_element_by_css_selector('span.errorTextL11')
	    	   status=delay.text
		table = browser.find_element_by_xpath(("//table[@class='table table-bordered table-condensed table-striped']/tbody/tr[5]/"+    			"td[2]"))
		table1 = browser.find_element_by_xpath(("//table[@class='table table-bordered table-condensed table-striped']/tbody/tr[1]/"+    			"td[2]"))
		trainNo=table1.text
		trainStatus=status+table.text
		print trainNo
		print trainStatus
    		writer.writerow({'trainNo' : trainNo, 'trainStatus': trainStatus})

	browser.back()

	browser.find_element_by_name('trainNo').clear()
	

 

