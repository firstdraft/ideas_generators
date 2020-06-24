# frozen_string_literal: true


require_relative 'lib/ideas_generators/version'

Gem::Specification.new do |spec|
  spec.name          = "ideas_generators"
  spec.version       = IdeasGenerators::VERSION
  spec.authors       = ["Dinesh Panda"]
  spec.email         = ["dineshpanda92@gmail.com"]

  spec.summary       = "Generator to setup an application quickly with Bootstrap styling"
  spec.description   = <<~DESCRIPTION
    This gem contains a scaffold generator which is similar to Rails scaffold generator
    with Bootstrap styles in the templates.
    Primarily, this gem is designed for Ideas. So that fully functional domain model
    resources can be generated for the generataed apps.
  DESCRIPTION

  spec.homepage      = "https://github.com/firstdraft/ideas_generators"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.5.0"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "railties"
end
