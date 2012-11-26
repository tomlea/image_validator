Gem::Specification.new do |s|
  s.name              = "image_validator"
  s.version           = "0.1.0"
  s.summary           = "Check if an image is valid"
  s.description       = "A simple wrapper around the ImageMagick command line to check if an image is valid."
  s.author            = "Tom Lea"
  s.email             = "contrib@tomlea.co.uk"
  s.homepage          = "http://tomlea.co.uk"

  s.has_rdoc          = true
  s.extra_rdoc_files  = %w(README.markdown)
  s.rdoc_options      = %w(--main README.markdown)

  s.files             = %w(README.markdown) + Dir.glob("{test,lib}/**/*")

  s.require_paths     = ["lib"]
  s.rubyforge_project = "image_validator"
end
