module IrohaSort
  class Comparator
    def initialize(iroha)
      @iroha= iroha
    end

    def compare(a, b)
      return nil unless comparable?(a)
      return nil unless comparable?(b)

      res= 0
      ary_a, ary_b= a.chars, b.chars

      size= [ary_a.length, ary_b.length].min
      size.times do |i|
        res= @iroha.index(ary_a[i]) <=> @iroha.index(ary_b[i])
        break unless res==0
      end

      if res== 0
        res= ary_a.length <=> ary_b.length
      end

      return res
    end

    def comparable?(str)
      str.each_char do |char|
        return false unless @iroha.index(char)
      end
      return true
    end
  end
end
