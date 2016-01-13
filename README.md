# auto-print 
## the automated printing CLI for Erickson Living
```
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
```

auto print is a ruby command line CLI that uses the selenium-webdriver based on the JDK development kit to automate and test browser interactions in firefox. 

the use intended for this program is to automate repetitive file screenshot compilation among the Erickson Living Marketing staff.
rather than print screenshots using a third party chrome app. you can print unlimited screenshots with the press of a button!

##Getting Started
you will need several things installed to get things going. 
Assuming you are working on MAC OSX, (which you should be) Ruby should be installed up to atleast ```v1.8.3``` 

take some time out to checkout the java development webkit (JDK). it is the platform that alot of the code is based on. 
get it here 
http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html

once you have this installed head over to your terminal, Zsh, or bash and install the gem via rubygems.com
```
$ gem install auto-print
```
 the command line will now spit out some output that will basically install all the related gems which include:
 
 ```selenium v 0.2.11``` a standalone server that runs off of JDK
 
 ```selenium-webdriver v 2.481``` for browser interactions that runs on ```selenium```
 
 ```colorize v 0.7.7``` for creating colorized and organized outputs in your terminal
 
 This program is still in beta and is under heavy development, but hey! feel free to use it as this is the only way i can know if this thing needs any additional software to work!
 
## usage
 
 auto-print comes with several flags
 
 help ```help``` will print a helpful welcome screen with basic usage details
 
 version ```version``` ```-v``` or ```-version``` will print the version you are using  and any additional information about the build process. 
 
 for the main command type 
 ```
 $ auto-print [url]
 ```
 do not pass any queries at the end of the url, this will confuse auto-print. and nobody likes to be confused. error handling will most likely be added to make sure no one can make this mistake.
 
 here is typically what your output may look like
 
```
 Do you wish to screenshot of
 http://YOUR-URL-WILL-APEAR-HERE.COM
without additional versioning? [Y/N/X]

YOU CAN EXIT THIS FORM AT ANY TIME BY PRESSING THE X KEY ON YOUR KEYBOARD
n




Is this campaign versioned? [Y/N/X]
y


are these emails?[Y/N/X]
y


is this a landing page connected to the email?
y


printing versioned landing pages for the followign communities
APL-EMAIL   ACH-EMAIL   BBV-EMAIL   CCV-EMAIL   CCI-EMAIL   CWF-EMAIL   DVF-EMAIL   ETH-EMAIL   FRV-EMAIL   GSV-EMAIL   HSD-EMAIL   LHN-EMAIL   LPH-EMAIL   MGC-EMAIL   OCV-EMAIL   RWV-EMAIL   SBV-EMAIL   TCK-EMAIL   WCD-EMAIL   %      
```
 
## the future is here!!
 
 in the recent weeks i have been working on making it possible to print based on different options and settings. you can now print individual URL's versioned campaigns, web-server-hosted emails, and their email related landing pages. answer the questions that your terminal prompts you to make the most out of this program. 
 
## Looking to the future of the future

the developer is also looking into printing urls based on a txt file in the folder, much like the popular comand ```wget```

I also plan on doing some work to create directories that separate emails and landing pages, but it does not seem necessary at this point
