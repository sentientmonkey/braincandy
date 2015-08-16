module Stats
  refine Array do
    alias_method :number, :size

    def mean
      return 0 unless number > 0
      reduce(&:+) / number.to_f
    end

    def median
      sort[number / 2]
    end

    def variance
      return 0 unless number > 0
      x = mean
      map{|n| (n-x)**2 }.reduce(&:+) / (number - 1.0)
    end

    def standard_deviation
      Math.sqrt variance
    end

    def stats
      { number: number,
        mean: mean,
        median: median,
        variance: variance,
        standard_deviation: standard_deviation }
    end
  end
end
