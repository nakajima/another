# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{another}
  s.version = "0.0.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Pat Nakajima"]
  s.date = %q{2008-11-20}
  s.default_executable = %q{another}
  s.email = %q{patnakajima@gmail.com}
  s.executables = ["another"]
  s.files = %W[
    another.gemspec
    bin
    bin/another
    lib
    lib/another
    lib/another/confirmer.rb
    lib/another/options.rb
    lib/another/runner.rb
    lib/another.rb
    lib/core_ext
    lib/core_ext/string.rb
    lib/core_ext/symbol.rb
    README
    spec
    spec/another_spec.rb
    spec/spec_helper.rb
    templates
    templates/js
    templates/js/manifest.txt
    templates/js/README.md
    templates/js/spec
    templates/js/spec/PROJECT_spec.js
    templates/js/spec/screw-unit
    templates/js/spec/screw-unit/jquery-1.2.6.js
    templates/js/spec/screw-unit/jquery.fn.js
    templates/js/spec/screw-unit/jquery.print.js
    templates/js/spec/screw-unit/screw.assets.js
    templates/js/spec/screw-unit/screw.behaviors.js
    templates/js/spec/screw-unit/screw.builder.js
    templates/js/spec/screw-unit/screw.css
    templates/js/spec/screw-unit/screw.events.js
    templates/js/spec/screw-unit/screw.matchers.js
    templates/js/spec/spec_helper.js
    templates/js/spec/suite.html
    templates/js/src
    templates/js/src/PROJECT.js
    templates/ruby
    templates/ruby/lib
    templates/ruby/lib/PROJECT
    templates/ruby/lib/PROJECT/.gitignore
    templates/ruby/lib/PROJECT.rb
    templates/ruby/manifest.txt
    templates/ruby/README.md
    templates/ruby/spec
    templates/ruby/spec/PROJECT_spec.rb
    templates/ruby/spec/spec_helper.rb
    templates/sinatra
    templates/sinatra/app.rb
    templates/sinatra/manifest.txt
    templates/sinatra/public
    templates/sinatra/public/.gitignore
    templates/sinatra/spec
    templates/sinatra/spec/PROJECT_spec.rb
    templates/sinatra/spec/spec_helper.rb
    templates/sinatra/views
    templates/sinatra/views/.gitignore
    
  ]
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
