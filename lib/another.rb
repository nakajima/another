require 'rubygems'
require 'fileutils'
require 'activesupport'
require 'erb'

class String
  def erb_eval(b)
    ERB.new(self).result(b)
  end
  
  def write(path)
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
      FileUtils.mkdir target_directory
      Dir[File.join(template_directory, "**", "**")].each do |file|
        copy!(file.split('/templates/').last)
      end
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
  end
  
  def self.run(args)
    Runner.new(args)
  end
end