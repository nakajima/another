require 'optparse'
require 'ostruct'

module Another
  class Options
    attr_reader :template, :project_name, :target
    
    def initialize(args)
      @args = args.dup
      process!
    end

    private
    
    def process!
      options = OpenStruct.new
      options.template = "ruby"

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: another [options] project-name"

        opts.on("-t", "--template TEMPLATE", "Specify a template (default: Ruby)") do |template|
          options.template = template
        end

        opts.on_tail("-h", "--help", "Show this message") do
          puts opts
          exit!
        end
      end

      opts.parse!(@args)

      if @args.empty?
        puts opts
        exit!
      else
        @target       = @args.shift
        @template     = options.template
        @project_name = File.basename(target)
      end
    end
  end
end