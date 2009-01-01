# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{another}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima"]
  s.date = %q{2008-11-20}
  s.default_executable = %q{another}
  s.email = %q{patnakajima@gmail.com}
  s.executables = ["another"]
  s.files = Dir.glob('**/**/**/**/**/**', File::FNM_DOTMATCH) \
    .reject { |f| f =~ /\.git\// } \
    .reject { |f| f =~ /^\.{1,2}$/ }
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{My new Ruby project generator}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<colored>, [">= 0"])
    else
      s.add_dependency(%q<colored>, [">= 0"])
    end
  else
    s.add_dependency(%q<colored>, [">= 0"])
  end

end
