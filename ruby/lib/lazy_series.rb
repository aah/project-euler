require_relative 'lazy_series/fibonacci'
require_relative 'lazy_series/naturals'

class Enumerator::Lazy
  def below(max)
    take_while { |i| i < max }
  end

  def even
    select(&:even?)
  end

  def multiples(divisors)
    select { |i| multiple? i, divisors }
  end

  def sum
    reduce(:+)
  end

  private
  def multiple?(i, divisors)
    divisors.any? { |divisor| i.remainder(divisor).zero? }
  end
end
