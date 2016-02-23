require 'color_echo/get'

module Diff
  class << self

    def string_to_a s
      a = []

      return a if s.nil?

      s.each_char do |c|
        a << c
      end

      return a
    end

    def set_diff w
      return w if w == ''
      return CE.ch(:red).get(w)
    end

    def diff s1, s2
      @word1 = string_to_a s1
      @word2 = string_to_a s2

      w1 = ''
      w2 = ''
      loop do
        d1, d2 = get_diff
        w1 += set_diff d1
        w2 += set_diff d2

        break if @word1.empty? or @word2.empty?

        w1 += @word1.shift
        w2 += @word2.shift
      end

      w1 += set_diff @word1.join
      w2 += set_diff @word2.join

      return w1, w2
    end

    def get_diff
      d1 = ''
      d2 = ''
      while @word1.first != @word2.first
        break if @word1.empty? or @word2.empty?
        k1 = @word1.find_index @word2.first
        k2 = @word2.find_index @word1.first

        if k1 == k2
          d1 += @word1.shift
          d2 += @word2.shift
          next
        end

        if k1.nil?
          d2 += @word2.shift
          next
        end

        if k2.nil?
          d1 += @word1.shift
          next
        end

        if k1 > k2
          k2.times do |n|
            d2 += @word2.shift
          end
        else
          k1.times do |n|
            d1 += @word1.shift
          end
        end
      end

      return d1, d2
    end
  end
end

