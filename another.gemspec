# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{another}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima"]
  s.date = %q{2008-11-20}
  s.default_executable = %q{another}
  s.email = %q{patnakajima@gmail.com}
  s.executables = ["another"]
  s.files = ["README", "bin/another", "lib/another.rb", "spec/another_spec.rb", "spec/spec_helper.rb", "templates/README.textile", "templates/lib/PROJECT.rb.erb", "templates/lib/PROJECT/.gitignore", "templates/spec/PROJECT_spec.rb.erb", "templates/spec/spec_helper.rb.erb"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{My new Ruby project generator}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
