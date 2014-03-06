$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "alchemy/devise/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "alchemy-devise"
  s.version     = Alchemy::Devise::VERSION
  s.authors     = ["Thomas von Deyen"]
  s.email       = ["tvd@magiclabs.de"]
  s.homepage    = "http://alchemy-cms.com"
  s.summary     = "Devise based user authentication for Alchemy CMS."
  s.description = "Devise based user authentication for Alchemy CMS."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "alchemy_cms", "~> 3.0.0.beta1"
  s.add_dependency "devise",      "~> 3.2.3"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "factory_girl_rails"
end
