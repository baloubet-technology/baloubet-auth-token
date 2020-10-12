# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise/token_authenticatable/version'

Gem::Specification.new do |spec|
  spec.name          = "baloubet-auth-token"
  spec.version       = Devise::TokenAuthenticatable::VERSION.dup
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Hugo Mori"]
  spec.email         = ["hugo.mori@baloubet.com"]
  spec.description   = %q{This gem provides the extracted Token Authenticatable module of devise.
                          It enables the user to sign in via an authentication token. This token
                          can be given via a query string or HTTP Basic Authentication.}
  spec.summary       = %q{Provides authentication based on an authentication token.}
  spec.homepage      = "https://github.com/baloubet-technology/baloubet-auth-token.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "devise",                         ">= 4.0.0", "< 5.0.0"

  spec.add_development_dependency "rails",              "~> 4.2"
  spec.add_development_dependency "rspec-rails",        "~> 3.0"
  spec.add_development_dependency "pry",                "~> 0.10"
  spec.add_development_dependency "factory_girl_rails", "~> 4.4"
  spec.add_development_dependency "timecop",            "~> 0.7"
  spec.add_development_dependency "bundler",            "~> 1.17"

  # Fix database connection with sqlite3 and jruby
  if    RUBY_ENGINE == 'ruby'
    # Match rails's expected version constraint
    spec.add_development_dependency "sqlite3",          "~> 1.3.6"
  elsif RUBY_ENGINE == 'jruby'
    spec.add_development_dependency "activerecord-jdbcsqlite3-adapter"
  end
end
