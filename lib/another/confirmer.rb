module Another
  module Confirmer
    def confirmed?
      say "Warning: Creating new projects makes you vulnerable to mockery.".bold
      answer ? true : begin
        say "Probably for the best."
      end
    end
    
    private
    
    def answer
      ask "Are you sure you want to create a new project? ".bold do |answer|
        answer =~ /^y/i
      end
    end
  end
end