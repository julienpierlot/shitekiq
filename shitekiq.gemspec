# frozen_string_literal: true

require_relative "lib/shitekiq/version"

Gem::Specification.new do |spec|
  spec.name = "shitekiq"
  spec.version = Shitekiq::VERSION
  spec.authors = ["Julien Pierlot"]
  spec.email = ["pierlot.julien@gmail.com"]

  spec.summary = "Ruby backend job processing."
  spec.description = "Like Sidekiq, but with less features"
  spec.homepage = "https://github.com/julienpierlot/shitekiq"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/julienpierlot/shitekiq"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "json", "~> 2.6.1"
  spec.add_dependency "redis", "~> 4.6.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
