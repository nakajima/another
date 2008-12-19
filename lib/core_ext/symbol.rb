class Symbol
  def to_proc
    Proc.new do |item|
      item.send(self)
    end
  end unless :test.respond_to?(:to_proc)
end