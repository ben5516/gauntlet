module Gauntlet
  module Problems
    
    class Problem
      
      OPERATOR_REGEX = Regexp.union(["*", "+", "-", "/"])
      NUMBER_REGEX = /\d+/
      
      attr_accessor :total, :values, :pending_values, :last_number
      
      def initialize(values)
        @values = values
        @pending_values = []
      end
      
      def do!
        values.each_with_index do |op, i|
          puts "i #{i}"
          if OPERATOR_REGEX.match(op)
            values[i] = [values[i-1].to_f, values[i-2].to_f].reduce(op.to_sym)
            # binding.pry
            2.times { values.delete_at(i-1) }
          end
        end
        # binding.pry
        values.last.to_f
      end
      
      
    end
    
    class PostfixCalculator
      
      # This one's not math, I swear!

      # Your job is to create a calculator which evaluates expressions
      # in postfix notation, sometimes called reverse Polish notation.

      # For example, the expression
      # 
      #     5 1 2 + 4 * + 3 -
      #
      # is equivalent to
      #
      #     5 + ((1 + 2) * 4) - 3
      #
      # and evaluates to 14.

      # Note for simplicity's sake you can assume there are always spaces
      # between numbers and operations.
      # e.g. `1 3 +` is valid but `1 3+` is not.

      # Source: Codewars

      def self.calc(expression)
        Problem.new(parse(expression)).do!
      end
      
      class << self
        
        def parse(exp)
          exp.split(/\s/)
        end
        
      end

    end
  end
end
