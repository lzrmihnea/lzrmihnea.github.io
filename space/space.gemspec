# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "space"
  spec.version       = "0.1.0"
  spec.authors       = ["Mihnea"]
  spec.email         = ["lzr_mihnea@yahoo.com"]

  spec.summary       = %q{"space" theme, which has the purpose of offering a view as spacious as possible.}
  spec.homepage      = "https://lzrmihnea.github.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.4"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
