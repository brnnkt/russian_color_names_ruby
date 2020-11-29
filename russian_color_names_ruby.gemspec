require_relative 'lib/russian_color_names_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = "russian_color_names_ruby"
  spec.version       = RussianColorNamesRuby::VERSION
  spec.authors       = ["brnnkt"]
  spec.email         = ["brnnkt@gmail.com"]

  spec.summary       = "List of HEX Colors in Russian 🌈"
  spec.description   = "List of HEX Colors in Russian 🌈"
  spec.homepage      = "https://theglitchy.com/sandbox/russian_color_names"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/brnnkt/russian_color_names_ruby"
  spec.metadata["changelog_uri"]   = "https://github.com/brnnkt/russian_color_names_ruby/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.files         <<  Dir['lib/**/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.9"
end
