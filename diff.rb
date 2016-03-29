require 'color_echo/get'

module Diff
  class << self

    def set diff
      return diff if diff.empty?
      diff.map {|d| CE.ch(:red).get(d)}.compact
    end

    def diff s1, s2
      @word1 = s1
      @word1 = s1.chars.to_a if s1.class == String
      @word2 = s2
      @word2 = s2.chars.to_a if s2.class == String

      w1 = []
      w2 = []
      loop do
        d1, d2 = get
        w1.concat set d1
        w2.concat set d2

        break if @word1.empty? or @word2.empty?

        w1 << @word1.shift
        w2 << @word2.shift
      end

      w1.concat set @word1
      w2.concat set @word2

      [w1, w2]
    end

    def get
      d1 = []
      d2 = []
      while @word1.first != @word2.first
        break if @word1.empty? or @word2.empty?
        k1 = @word1.find_index @word2.first
        k2 = @word2.find_index @word1.first

        if k1 == k2
          d1 << @word1.shift
          d2 << @word2.shift
          next
        end

        if k1.nil?
          d2 << @word2.shift
          next
        end

        if k2.nil?
          d1 << @word1.shift
          next
        end

        if k1 > k2
          k2.times do
            d2 << @word2.shift
          end
        else
          k1.times do
            d1 << @word1.shift
          end
        end
      end

      [d1, d2]
    end
  end
end

