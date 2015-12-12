require 'color_echo/get'

module Diff
  class << self

    def string_to_a s
      a = []
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
      word1 = string_to_a s1
      word2 = string_to_a s2

      w1 = ''
      w2 = ''
      loop do
        d1 = ''
        d2 = ''

        while word1.first != word2.first
          if word1.size > word2.size
            d1 += word1.shift
            if word2.include? word1.first
              d2 += word2.shift
            end
          else
            d2 += word2.shift
            if word1.include? word2.first
              d1 += word1.shift
            end
          end
        end

        w1 += set_diff d1
        w2 += set_diff d2

        break if word1.empty? and word2.empty?

        w1 += word1.shift
        w2 += word2.shift
      end

      return w1, w2
    end

  end
end

