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
      word1 = string_to_a s1
      word2 = string_to_a s2

      w1 = ''
      w2 = ''

      d1 = ''
      d2 = ''
      loop do
        if word1.empty? or word2.empty?
          w1 += d1
          w2 += d2
          w1 += set_diff word1.join
          w2 += set_diff word2.join
          break
        end

        if word1.first == word2.first
          w1 += d1
          w2 += d2
          d1 = ''
          d2 = ''
          w1 += word1.shift
          w2 += word2.shift
          next
        end

        k1 = word1.find_index word2.first
        k2 = word2.find_index word1.first

        if k1.nil? and k2.nil?
          d1 += set_diff word1.shift
          d2 += set_diff word2.shift
          next
        end

        if a.nil?
          d2 += set_diff word2.shift
          next
        end

        if b.nil?
          d1 += set_diff word1.shift
          next
        end

        if a == b
          d1 += set_diff word1.shift
          d2 += set_diff word2.shift
        elsif a > b
          b.times do |n|
            d2 += set_diff word2.shift
          end
        else
          a.times do |n|
            d1 += set_diff word1.shift
          end
        end
      end

      return w1, w2
    end

  end
end

