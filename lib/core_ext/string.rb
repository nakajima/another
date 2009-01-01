require 'erb'

class String
  def erb_eval(b)
    ERB.new(self).result(b)
  end
  
  def write(path)
    File.open(path, 'w+') do |file|
      file << self
    end
    puts "- #{path}"
  end
  
  def sans(str)
    gsub(str, '')
  end
  
  def blank?
    gsub(/\t|\s/, '').empty?
  end
  
  def underscore
    gsub(/\W+/, '_')
  end
end