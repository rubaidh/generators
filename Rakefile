require 'rake'
require 'rake/rdoctask'
require 'rake/gempackagetask'

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Rubaidh Generators'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('CHANGELOG')
  rdoc.rdoc_files.include('MIT-LICENSE')
end

Rake::GemPackageTask.new(eval(File.read('generators.gemspec'))) do |p|
  p.need_tar = false
  p.need_zip = false
end
