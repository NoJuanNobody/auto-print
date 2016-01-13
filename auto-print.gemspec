Gem::Specification.new do |s|
  s.name        = 'auto-print'
  s.version     = '0.2.0'
  s.date        = '2015-12-12'
  s.summary     = "auto-print"
  s.description = "automated image processing for url versioning in the erickson living corporation"
  s.authors     = ["Alejandro Londono"]
  s.email       = 'alejandro.londono@erickson.com'
  s.files       = ["lib/auto-print.rb"]
  s.license       = 'apache'
  s.executables << 'auto-print'
  s.add_runtime_dependency "selenium",  '~> 0.2.10', '>= 0.2.11'
  s.add_runtime_dependency "selenium-webdriver",  '~> 2.48', '>= 2.48.1'
  s.add_runtime_dependency "colorize",  '~> 0.0', '>= 0.7.7'
end