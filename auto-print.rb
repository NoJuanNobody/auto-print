require 'rubygems'
require 'selenium-webdriver'
#################
# COMMAND 
#################
#  auto-print [url] 
url = ARGV[0]
puts url
com_codes = ['apl', 'ach', 'bbv', 'ccv', 'cci', 'cwf', 'dvf', 'eth', 'frv', 'gsv', 'hsd', 'lhn', 'lph', 'mgc', 'ocv', 'rwv', 'sbv', 'tck', 'wcd']
size = {
	'medium' => 1200,
	'small' =>992,
	'xsmall' => 768,
	'mobile' => 400
}
driver = Selenium::WebDriver.for :firefox

com_codes.each do |com|
	driver.navigate.to "#{url}"+"?from="+"#{com}".upcase
	driver.save_screenshot("#{com}".upcase+".png")
	puts "#{com}".upcase
end

size.each do |key, number|
	driver.navigate.to "#{url}"
	puts key
	driver.manage.window.resize_to(number-50,800)
	driver.save_screenshot("#{number}".upcase+".png")
end
