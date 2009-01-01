module Another
  class InvalidTemplate < StandardError; end
  
  class Runner
    attr_reader :options
    
    include Another::Confirmer
    
    def initialize(args)
      @options = Options.new(args)
    end
    
    def perform!
      @performing = true
      
      raise InvalidTemplate.new("`#{template}` is not a valid template.\nAvailable templates: #{available_templates.join(', ')}")
      
      return unless confirmed?
      
      say "Copying files for #{template}..."

      manifest.each do |file|
        copy!(file)
      end
      
      say "done!"
    end
    
    def available_templates
      Dir[template_path('../*')].map &File.method(:basename)
    end
    
    def manifest
      File.read(template_path('manifest.txt')).split(/\n+/).reject(&:blank?)
    end
    
    def target
      options.target
    end
    
    def project_name
      options.project_name
    end
    
    def template
      options.template
    end
    
    def module_name
      project_name.split(/\W/).map(&:capitalize).join
    end
    
    def target_path(path='')
      File.expand_path File.join(
        Dir.pwd,
        target,
        path.gsub('PROJECT', project_name.gsub(/\W+/, '_')))
    end
    
    def template_path(path='')
      File.expand_path File.join(File.dirname(__FILE__), *%W[.. .. templates #{template} #{path}])
    end
    
    def copy!(path)
      begin
        read(path) \
          .erb_eval(binding) \
          .write(target_path(path))
      rescue Errno::ENOENT => e
        raise e if File.exists?(target_path)
        FileUtils.mkdir_p(target_path)
        retry
      rescue Errno::EISDIR
        FileUtils.mkdir_p target_path(path)
      end
    end
    
    def performing?
      @performing
    end
    
    def read(path)
      File.read(template_path(path))
    end
    
    def say(msg)
      puts(msg) if performing?
    end
    
    def ask(msg)
      print msg if performing?
      yield $stdin.gets.chomp
    end
  end
end