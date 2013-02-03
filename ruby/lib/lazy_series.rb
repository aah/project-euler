require_relative 'lazy_series/fibonacci'

class Enumerator::Lazy
  def below max
    take_while { |i| i < max }
  end

  def even
    select(&:even?)
  end

  def sum
    reduce(:+)
  end
end
