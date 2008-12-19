$LOAD_PATH << File.join(File.dirname(__FILE__), *%w[core_ext])
$LOAD_PATH << File.join(File.dirname(__FILE__), *%w[another])

%w[rubygems colored fileutils string symbol runner].each { |lib| require lib }

module Another
  def self.run(args)
    Runner.new(args)
  end
end