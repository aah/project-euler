module LazySeries
  class Naturals
    def self.terms(start: 1)
      (start..Float::INFINITY).lazy
    end
  end
end
