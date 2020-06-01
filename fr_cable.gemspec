require_relative 'lib/fr_cable/version'

Gem::Specification.new do |spec|
  spec.name          = "fr_cable"
  spec.version       = FrCable::VERSION
  spec.authors       = ["Dmitriy"]
  spec.email         = ["0x000def42@gmail.com"]

  spec.summary       = %q{
    Http rack based server middleware compable with fr-cable-server
  }
  # spec.description   = %q{
  #   Write a longer description or delete this line
  # }
  spec.homepage      = "https://github.com/fr-cable/fr-cable-ruby"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fr-cable/fr-cable-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/fr-cable/fr-cable-ruby/blob/master/CHANGELOG.md"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
