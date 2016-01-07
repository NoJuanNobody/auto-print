require 'rubygems'
require 'selenium-webdriver'
require 'colorize'
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



if ARGV.length == 1 and ARGV[0] == "help"
	puts "
		______________________
		|                    |
		|  A U T O P R I N T |
		|                    |
		|  ~~~~~~~~~~~~~~~~~ |
		|  ~~~~~~~~~~~~~~~~~ |
		|  ~~~~~~~~~~~~~~~~~ |
		|  ~~~~~~~~~~~~~~~~~ |
		|  ~~~~~~~~~~~~~~~~~ |
		|  ~~~~~~~~~~~~~~~~~ |
		L____________________|

".cyan

 puts "         THE AUTOMATED PRINTING PROGRAM ".yellow.blink

puts "this program has been written to automate the process of preparing screenshots and printing them for strategy to pass their aproval. instead of taking hours to compile the necessary images, you can print them in seconds!

this also makes things easier when uploading to NOOSH

to run the program run this command:\n\n"

puts "auto-print [url]\n".yellow

print "where " 
print " [url] ".yellow 
puts "is the webpage you wish to make a screenshot\n\n"

puts "make sure to not unclude any javascript variables in the url\n".red

puts "you will be asked to answer a few questions about your project and then the necessary files will be created.
make sure to delete any community webpages that were generated that are not apart of your campaign."


elsif ARGV.length == 1 and (ARGV[0] == "-v" or ARGV[0] == "-version" or ARGV[0] == "version")

	puts "
				__________________________
				| VERSION 0.1.0          |
				--------------------------
				".colorize(:yellow)
	puts  " the use of this program is open source, but intended for the needs of Erickson Living employees only. if you wish to make a pull request you may do so at \n\n".yellow
	puts  "https://github.com/alejandro-londono/auto-print".colorize(:color=>:white, :background=>:blue)
	puts "\n\n"
# --------------------------------------------
# if the user input has nothing to do with the help or version options this code is run
elsif ARGV.length == 1 and ARGV[0] != "version" or ARGV[0] != "help" or ARGV[0] != '-version' or ARGV[0] != "-v"  
	# line 68 catches any user input that relates to .xls files in the form of 
	# prune-erickson yourfile.xls [digit] outputfile.xls

	

	def url_question
		puts "\n\n"
		print "Do you wish to screenshot the URL without additional versioning? [Y/N/X]\n\n".yellow
		puts "you can exit this form at any time by pressing the X key on your keyboard".blue.blink

		settingsResponse = STDIN.gets.strip.uppercase
		print "\n\n"

		if versioningResponse = 'Y'
			puts "what do you wish to name the file?".green
			name = STDN.gets.strip
			screenshot(name)
		elsif versioningResponse ='X'
			break
		else
			version_question
		end
	end
	def version_question()
		puts "\n\n" 
		puts "Is this campaign versioned? [Y/N/X]".yellow
		puts "you can exit this form at any time by pressing the X key on your keyboard".blue.blink

		campaignResponse = STDIN.gets.strip
		print "\n\n"

		if campaignResponse = 'y' || 'Y'
			email_question()
		else
			puts "which community do you wish to print please insert a 3 letter com code"
			com = STDIN.gets.strip.uppercase
			email_question()
		end
	end
	def email_question()
		puts "are these emails?"
		# finish this up later

	end

	def screenshot(name)
		driver.navigate.to "#{url}"
		driver.save_screenshot("#{name}"+".png")
	end
	def screenshot
	def LP_screenshot(url, com_codes)
		if url =~ /(http)+[\S]*/
			puts "program"
			driver = Selenium::WebDriver.for :firefox
			com_codes.each do |com|
				# printing email CS
				driver.navigate.to "#{url}"+"?from="+"#{com}-EMAIL".upcase
				driver.save_screenshot("#{com}".upcase+"-email.png")
				puts "#{com}-EMAIL".upcase
			end	
	end

	def email_screenshot(url, com_codes)
		if url =~ /(http)+[\S]*/
		puts "program"
		driver = Selenium::WebDriver.for :firefox
		com_codes.each do |com|
			# landing pages
			driver.navigate.to "#{url}"+"?from="+"#{com}".upcase
			driver.save_screenshot("#{com}".upcase+".png")
			puts "#{com}".upcase
		end
	end

		# size.each do |key, number|
		# 	driver.navigate.to "#{url}"
		# 	puts key
		# 	driver.manage.window.resize_to(number-50,800)
		# 	driver.save_screenshot("#{number}".upcase+".png")
		# end
		
		
	else
		print "\n 
		Are you trying to use auto-print? 
		why dont you try this command:\n\n
		auto-print help \n\n\n
		"
	end
end
