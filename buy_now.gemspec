
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "buy_now/version"

Gem::Specification.new do |spec|
  spec.name          = "buy_now"
  spec.version       = BuyNow::VERSION
  spec.authors       = ["'Josue Abraham'"]
  spec.email         = ["'josuea@noukod.com'"]

  spec.summary       = %q{Some items you can buy.}
  spec.description   = %q{CLI app that scrapes information and returns some items available for buying
                          and their details from shopanu. https://shopanu.com}
  spec.homepage      = "https://github.com/Joecleverman/buy_now"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
