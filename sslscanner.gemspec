# -*- encoding: utf-8 -*
require File.expand_path("../lib/scanssl/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sslscanner'
  s.version     = SslScanner::VERSION
  s.date        = '2016-08-30'
  s.summary     = 'sslscanner'
  s.description = 'A simple and easy to use SSL Cipher scanner'
  s.authors     = ["bararchy", "ik5", "elichai", "Dor Lerner", "wolfedale"]
  s.email       = ''
  s.files       = ["lib/scanssl.rb",
		   "lib/scanssl/version.rb",
		   "lib/scanssl/certInfo.rb",
		   "lib/scanssl/fileExport.rb",
		   "lib/scanssl/scanHost.rb",
                   "lib/scanssl/settings.rb"]
  s.homepage	= 'https://github.com/krishpranav/sslscanner'
  s.license     = 'MIT'

  s.executables = ["scanssl"]
  s.require_paths = ["lib"]

  s.add_dependency('colorize', '~> 0')
  s.add_dependency('prawn', '~> 0')
end
