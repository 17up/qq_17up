$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "open_qq/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "qq_17up"
  s.version     = OpenQq::VERSION
  s.authors     = ["veggie"]
  s.email       = ["kkxlkkxllb@gmail.com"]
  s.homepage    = "https://github.com/17up/qq_17up"
  s.summary     = "open qq ruby sdk"
  s.description = "腾讯开放平台ruby版SDK http://open.qq.com/"

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "activesupport"

  s.add_development_dependency "turn"
  s.add_development_dependency "minitest"
  s.add_development_dependency "yard"
  s.add_development_dependency "rake"
  s.add_development_dependency "fakeweb"

end
