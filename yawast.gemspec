$:.push File.expand_path("../lib", __FILE__)
require File.expand_path("../lib/version", __FILE__)

Gem::Specification.new do |s|
  s.name              = 'yawast'
  s.version           = Yawast::VERSION
  s.platform          = Gem::Platform::RUBY
  s.summary           = "The YAWAST Antecedent Web Application Security Toolkit"
  s.description       = "YAWAST is an application meant to simplify initial analysis and information gathering for penetration testers and security auditors."
  s.authors           = ["Adam Caudill"]
  s.email             = 'adam@adamcaudill.com'
  s.homepage          = 'https://github.com/adamcaudill/yawast'
  s.license           = 'MIT'
  s.rubyforge_project = "yawast"

  s.add_runtime_dependency 'ssllabs', '~> 1.24'
  s.add_runtime_dependency 'commander', '~> 4.4'
  s.add_runtime_dependency 'highline', '~> 1.7'
  s.add_runtime_dependency 'openssl-extensions', '~> 1.2'
  s.add_runtime_dependency 'colorize', '~> 0.8'
  s.add_runtime_dependency 'ipaddr_extensions', '~> 1.0'

  s.bindir            = 'bin'
  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables       = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path      = ["lib"]
end
