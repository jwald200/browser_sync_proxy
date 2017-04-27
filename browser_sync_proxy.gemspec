# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'browser_sync_proxy/version'

Gem::Specification.new do |spec|
  spec.name          = "browser_sync_proxy"
  spec.version       =  BrowserSyncProxy::VERSION
  spec.authors       = ["Jacob S. Wald"]
  spec.email         = ["jwald110@gmail.com"]

  spec.summary       = %q{`browser_sync_proxy` eases the usage of browser-sync with your dynamic application.}
  spec.description   = %q{`browser_sync_proxy` eases the usage of browser-sync with your dynamic application.
                          You can probably use it with any application (besides Ruby), but I use it with Sinatra and Rails.}
  spec.homepage      = "https://github.com/jwald200/browser_sync_proxy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.required_ruby_version = ">= 2.3.0"

  spec.bindir        = "bin"
  spec.executables   = %w(bsync browser_sync_proxy)
  spec.require_paths = ["lib"]


  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_runtime_dependency "require_all"
  spec.add_runtime_dependency "colorize"
  spec.add_runtime_dependency "thor"
end
