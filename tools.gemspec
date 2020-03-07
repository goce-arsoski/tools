require_relative 'lib/tools/version'

Gem::Specification.new do |spec|
  spec.name          = "tools"
  spec.version       = Tools::VERSION
  spec.authors       = ["goce-arsoski"]
  spec.email         = ["goce_ars@yahoo.com"]

  spec.summary       = %q{Luhn algorithm}
  spec.description   = %q{Testing Ruby}
  spec.homepage      = "https://github.com/goce-arsoski/"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/goce-arsoski/car/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/goce-arsoski/car/"
  spec.metadata["changelog_uri"] = "https://github.com/goce-arsoski/car/"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
