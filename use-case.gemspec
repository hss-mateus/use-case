require_relative "lib/use-case/version"

Gem::Specification.new do |spec|
  spec.name = "use-case"
  spec.version = UseCase::VERSION
  spec.authors = ["hss-mateus"]
  spec.email = ["hss-mateus@pm.me"]

  spec.summary = "Utility classes for writing (optionally) typed use-cases"
  spec.homepage = "https://github.com/hss-mateus/use-case"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0")
  end
  spec.require_paths = ["lib"]
end
