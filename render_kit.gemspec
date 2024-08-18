# frozen_string_literal: true

require_relative "lib/render_kit/version"

Gem::Specification.new do |spec|
  spec.name = "render_kit"
  spec.version = RenderKit::VERSION
  spec.authors = ["Reegan Viljoen"]
  spec.email = ["reeganviljoen@outlook.com"]

  spec.summary = "A small library to allow claases to be rendered oike partials in Rails"
  spec.description = "A small library to allow claases to be rendered oike partials in Rails"
  # spec.homepage = "TODO: Put your gem's website or public repo URL here."
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "minitest", "~> 5.18"
  spec.add_development_dependency "puma", "~> 6"
  spec.add_development_dependency "standard", "~> 1"
end
