# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name          = "activeadmin-refinerycms-authentication"
  s.version       = "0.0.2"
  s.authors       = ["eugen neagoe"]
  s.description   = "A Refinery CMS and activeadmin connector"
  s.summary       = "This will tell Refinery CMS to use ActiveAdmin for authentication."
  s.homepage      = ""

  s.files         = `git ls-files`.split($/)
  s.test_files    = s.files.grep(%r{^spec/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'activeadmin', '~> 1.0.0pre'

  s.add_runtime_dependency 'refinerycms-core', '~> 3.0.0'
  s.add_runtime_dependency 'zilch-authorisation', '>= 0.0.1'
  s.add_runtime_dependency 'decorators', '~> 2.0.0'
  s.add_runtime_dependency 'deface', '~> 1.0.0'
end
