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
				| VERSION 0.2.0          |
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

	def url_question(url, com_codes)
		puts "\n\n"
		puts "Do you wish to screenshot of".yellow
		puts " #{url} ".red
		print "without additional versioning? [Y/N/X]\n\n".yellow
		puts "you can exit this form at any time by pressing the X key on your keyboard".upcase.yellow

		versioningResponse = STDIN.gets.strip.upcase
		print "\n\n"

		if versioningResponse == 'Y'
			puts "what do you wish to name the file?".green
			name = STDIN.gets.strip.upcase
			screenshot(name, url)
		elsif versioningResponse =='X'
			puts "exiting sequence"
		else
			version_question(url, com_codes)
		end
	end
	def version_question(url, com_codes)
		puts "\n\n" 
		puts "Is this campaign versioned? [Y/N/X]".yellow
		# puts "you can exit this form at any time by pressing the X key on your keyboard".yellow

		campaignResponse = STDIN.gets.strip.upcase
		print "\n\n"

		if campaignResponse =='Y'
			email_question( url, com_codes)
		else
			puts "which community do you wish to print please insert a 3 letter com code".yellow
			com = STDIN.gets.strip.upcase
			email_question(url, com_codes, com)
		end
	end

	def email_question(url, com_codes, com = '')
		puts "are these emails?[Y/N/X]".yellow
		emailResponse = STDIN.gets.strip.upcase
		print"\n\n"
		if emailResponse == 'Y'
			puts "is this a landing page connected to the email?".yellow
			emailLPresponse = STDIN.gets.strip.upcase
			print "\n\n"
		end

		unless com.length < 3
			com_codes = ["#{com}"]
		end

		if emailResponse == 'Y'
			
			if emailLPresponse == 'Y'
				LP_email_screenshot(url, com_codes)
			else
				email_screenshot(url, com_codes)
			end
		elsif emailResponse == 'N'
			LP_screenshot(url, com_codes)
		else
			print "exiting sequence".red
		end
	end

	def screenshot(name, url=ARGV[0])
		driver = Selenium::WebDriver.for :firefox
		driver.navigate.to url
		driver.save_screenshot("#{name}"+".png")
	end

	def LP_email_screenshot(url, com_codes)
		# if url =~ /(http)+[\S]*/
			puts "printing versioned landing pages for the followign communities".blink
			driver = Selenium::WebDriver.for :firefox
			com_codes.each do |com|
				# printing email CS
				driver.navigate.to "#{url}"+"?from="+"#{com}&Source=Email".upcase
				driver.save_screenshot("#{com}".upcase+"-email.png")
				print "#{com}-EMAIL   ".upcase
			end	
		# end
	end
	def LP_screenshot(url, com_codes)
		# if url =~ /(http)+[\S]*/
		
			puts "printing versioned emails for the following communities".blink
			driver = Selenium::WebDriver.for :firefox
			com_codes.each do |com|
				# landing pages 
				driver.navigate.to "#{url}"+"?from="+"#{com}&Source=Banner".upcase
				driver.save_screenshot("#{com}".upcase+".png")
				print "#{com}   ".upcase
			end
		# end
	end
	def email_screenshot(url, com_codes)
		# if url =~ /(http)+[\S]*/
		
			puts "printing versioned emails for the following communities".blink
			driver = Selenium::WebDriver.for :firefox
			com_codes.each do |com|
				# landing pages
				driver.navigate.to "#{url}"+"#{com}".upcase+"_email.html"
				driver.save_screenshot("#{com}".upcase+".png")
				print "#{com}   ".upcase
			end
		# end
	end
	url_question(url, com_codes)
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
