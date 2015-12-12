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

    def diff s1, s2
      word1 = self.string_to_a s1
      word2 = self.string_to_a s2

      diff = false

      w1 = ''
      w2 = ''

      loop do
        break if word1.empty? and word2.empty?

        if word1.empty? or word2.empty?
          unless diff
            w1 += '['
            w2 += '['

            diff = true
          end

          w1 += word1.join
          w2 += word2.join

          if diff
            w1 += ']'
            w2 += ']'

            diff = false
          end

          break
        end

        if word1.first == word2.first
          if diff
            w1 += ']'
            w2 += ']'

            diff = false
          end

          w1 += word1.shift
          w2 += word2.shift

          next
        end

        unless diff
          w1 += '['
          w2 += '['

          diff = true
        end

        if word1.size > word2.size
          w1 += word1.shift
        else
          w2 += word2.shift
        end
      end

      w1 = CE.pickup(/\[.*?\]/, :h_red).get(w1)
      w2 = CE.pickup(/\[.*?\]/, :h_red).get(w2)

      return w1, w2
    end
  end
end

