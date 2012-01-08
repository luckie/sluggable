$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sluggable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sluggable"
  s.version     = Sluggable::VERSION
  s.authors     = ["Tom Miller"]
  s.email       = ["jackerran@gmail.com"]
  s.homepage    = "http://www.github.com/luckie/sluggable"
  s.summary     = "Active Record extension to support slugs"
  s.description = "Active Record extension to support slugs"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"

  s.add_development_dependency "sqlite3"
end
