# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{isigned}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["iSigned"]
  s.date = %q{2010-07-25}
  s.description = %q{iSigned - Securely store, manage and share your important documents}
  s.email = %q{info@isigned.com}
  s.files = [
    "lib/extensions.rb",
     "lib/isigned.rb",
     "lib/isigned/api/api.rb",
     "lib/isigned/api/response.rb",
     "lib/isigned/models/document.rb",
     "lib/isigned/models/folder.rb",
     "lib/isigned/models/model.rb",
     "lib/isigned/models/user.rb"
  ]
  s.homepage = %q{http://github.com/gundua/isigned-api-gem}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{iSigned - Securely store, manage and share your important documents}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

