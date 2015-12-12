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

    def set_diff d
      unless d.length == 0
        d = '[' + d + ']'
      end

      return d
    end

    def set_color w
      return CE.pickup(/\[.*?\]/, :h_red).get(w)
    end

    def diff s1, s2
      word1 = self.string_to_a s1
      word2 = self.string_to_a s2

      d1 = ''
      d2 = ''
      w1 = ''
      w2 = ''
      loop do
        while word1.first != word2.first
          if word1.size > word2.size
            d1 += word1.shift
          else
            d2 += word2.shift
          end
        end

        w1 += self.set_diff d1
        w2 += self.set_diff d2

        d1 = ''
        d2 = ''

        break if word1.empty? and word2.empty?

        w1 += word1.shift
        w2 += word2.shift
      end

      w1 = set_color w1
      w2 = set_color w2

      return w1, w2
    end
  end
end

