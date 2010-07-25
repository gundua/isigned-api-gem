require 'rubygems'
require 'rake'
require 'rake/rdoctask'

begin
  require 'jeweler'

  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "isigned"
    gemspec.summary = "iSigned - Securely store, manage and share your important documents"
    gemspec.description = "iSigned - Securely store, manage and share your important documents"
    gemspec.email = "info@isigned.com"
    gemspec.homepage = "http://github.com/gundua/isigned-api-gem"
    gemspec.authors = ["iSigned"]
    gemspec.files = FileList['lib/**/*.rb']
  end

rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

desc 'Generate documentation'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'doc'
  rdoc.title    = 'iSigned'
  rdoc.options << '--line-numbers' << '--inline-source' << "--force-update"
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.main = "README.rdoc"

  rdoc.rdoc_files.include('lib/**/*.rb')
end