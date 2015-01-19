$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "touches/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "touches"
  s.version     = Touches::VERSION
  s.authors       = ["cgregor"]
  s.email         = ["chrgregor@gmail.com"]
  s.summary       = %q{touches a class with has_and_belongs_to_many}
  s.description   = %q{'touch: true' is possible only on belongs_to. This gem makes it possible to touch the instance of class A which has a has_and_belongs_to_many :b relation. Just insert the line 'touches :a' into class B. }
  s.homepage    = "https://github.com/grgr/touches"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"

  s.add_development_dependency "sqlite3"
end
