require 'rubygems'
require 'nakajima'
require 'fileutils'
require 'activesupport'
require 'erb'

class String
  def erb_eval(b)
    ERB.new(self).result(b)
  end
  
  def write(path)
    puts "- #{path}"
    File.open(path, 'w') do |file|
      file << self
    end
  end
  
  def sans(str)
    self.gsub(str, '')
  end
end

module Another
  class Runner
    def initialize(args)
      @args = args
      return if test_mode?
      return puts("Probably for the best.") unless confirmed?
      say! "Copying files..."
      FileUtils.mkdir target_directory
      Dir[File.join(template_directory, "**", "**")].each do |file|
        copy!(file.split('/templates/').last)
      end
      say! "done!"
    end
    
    def confirmed?
      true
      say! "Warning: Creating new projects makes you vulnerable to mockery.".bold
      say "Are you sure you want to create a new project? ".bold
      answer = $stdin.gets.chomp
      answer =~ /^y/i
    end
    
    def test_mode?
      defined?(Spec)
    end
    
    def project_name
      @args.first
    end
    
    def module_name
      project_name.underscore.camelize
    end
    
    def target_directory(path='')
      File.expand_path \
        [
          Dir.pwd,
          project_name,
          path \
            .gsub('PROJECT', project_name.underscore) \
            .sans('.erb')
        ].compact.join("/")
    end
    
    def template_directory(path='')
      File.expand_path(File.dirname(__FILE__) + '/../templates/' + path)
    end
    
    def copy!(path)
      begin
        read(path) \
          .erb_eval(binding) \
          .write(target_directory(path))
      rescue Errno::EISDIR
        FileUtils.mkdir target_directory(path)
      end
    end
    
    def read(path)
      File.read(template_directory(path))
    end
    
    def say!(msg)
      say(msg)
      say("\n")
    end
    
    def say(msg)
      return if test_mode?
      print msg
    end
  end
  
  def self.run(args)
    Runner.new(args)
  end
end