# frozen_string_literal: true

require_relative "lib/hello_world/version"

Gem::Specification.new do |spec|
  spec.name = "hello_world"
  spec.version = HelloWorld::VERSION
  spec.authors = ["Tim Uruski"]
  spec.email = ["tim.uruski@xperi.com"]

  spec.summary = "HelloWorld gem"
  spec.description = "HelloWorld gem"
  spec.homepage = "http://example.org"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://example.org"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https:/example.org"
  # spec.metadata["changelog_uri"] = "https://example.org"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "zeitwerk", "~> 2.6.8"
end
