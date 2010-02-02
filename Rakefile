require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"

task :default => :test

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

spec = Gem::Specification.new do |s|
  s.name              = "image_validator"
  s.version           = "0.1.0"
  s.summary           = "A simple wrapper around the ImageMagick command line to check if an image is valid."
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

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

Rake::RDocTask.new do |rd|
  rd.main = "README.markdown"
  rd.rdoc_files.include("README.markdown", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package]
