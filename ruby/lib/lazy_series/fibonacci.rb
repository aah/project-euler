module LazySeries
  class Fibonacci
    def self.terms
      Enumerator.new do |yielder|
        a, b = 1, 1
        loop do
          yielder.yield a
          a, b = b, a + b
        end
      end.lazy
    end
  end
end
