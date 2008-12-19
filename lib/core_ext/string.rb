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