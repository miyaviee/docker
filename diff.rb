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

      loop do
        if word1.first != word2.first
          if word1.size <= word2.size
            word, word2 = check word1, word2
            w2 += set_diff word
          else
            word, word1 = check word2, word1
            w1 += set_diff word
          end
        end

        if word1.empty?
          w2 += set_diff word2.join
          break
        end

        if word2.empty?
          w1 += set_diff word1.join
          break
        end

        w1 += word1.shift
        w2 += word2.shift
      end

      return w1, w2
    end

    def check s, l
      w = ''
      loop do
        break if l.first == s.first
        k = l.find_index s.first
        if k.nil?
          w = l.join
          l = []
          break
        end
        k.times do
          w += l.shift
        end
      end

      return w, l
    end

  end
end

