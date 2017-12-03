# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-dedot_filter"
  spec.version       = File.read("VERSION").strip
  spec.authors       = ["Tomoyuki Sugimura"]
  spec.email         = ["tomoyuki.sugimura@gmail.com"]

  spec.summary       = %q{de-dot field name for elasticsearch}
  spec.description   = %q{de-dot field name for elasticsearch}
  spec.homepage      = "https://github.com/lunardial/fluent-plugin-dedot_filter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 2.1"

  spec.add_runtime_dependency "fluentd", ">= 0.14.0", "< 2"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "test-unit"
end
