require_relative "lib/literal_enums/rails/version"

Gem::Specification.new do |spec|
  spec.name        = "literal_enums-rails"
  spec.version     = LiteralEnums::Rails::VERSION
  spec.authors     = ["Joel Drapper"]
  spec.email       = ["joel@drapper.me"]
  spec.homepage    = "https://github.com/joeldrapper/literal_enums-rails"
  spec.summary     = "Literal Enums in Rails."
  spec.description = "Rails support for Literal Enums."
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/joeldrapper/literal_enums-rails"
  spec.metadata["changelog_uri"] = "https://github.com/joeldrapper/literal_enums-rails"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "~> 7.0"
  spec.add_dependency "literal_enums", "> 1.0", "< 3"

  spec.add_development_dependency "mocha", "~> 1.13.0"
end
