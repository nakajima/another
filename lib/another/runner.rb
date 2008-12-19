module Another
  class Runner
    def initialize(args)
      @args = args
      return if test_mode?
      return puts("Probably for the best.") unless confirmed?
      say "Copying files..."
      FileUtils.mkdir target_directory
      Dir[File.join(template_directory, "**", "**")].each do |file|
        copy!(file.split('/templates/').last)
      end
      say "done!"
    end
    
    def confirmed?
      say "Warning: Creating new projects makes you vulnerable to mockery.".bold
      ask "Are you sure you want to create a new project? ".bold do |answer|
        answer =~ /^y/i
      end
    end
    
    def test_mode?
      defined?(Spec)
    end
    
    def project_name
      @args.first
    end
    
    def module_name
      project_name.gsub(/\W+/, '_').split('_').map(&:capitalize).join
    end
    
    def target_directory(path='')
      File.expand_path \
        [
          Dir.pwd,
          project_name,
          path \
            .gsub('PROJECT', project_name.gsub(/\W+/, '_')) \
            .sans('.erb')
        ].compact.join("/")
    end
    
    def template_directory(path='')
      File.join(File.dirname(__FILE__), *%W[.. .. templates #{path}])
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
    
    def say(msg)
      puts(msg) unless test_mode?
    end
    
    def ask(msg)
      print msg unless test_mode?
      yield $stdin.gets.chomp
    end
  end
end