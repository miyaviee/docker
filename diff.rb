require 'color_echo/get'

module Diff
  class << self
    def string_to_h s
      a = []
      s.each_char do |c|
        a << c
      end

      return a
    end

    def diff_start
      @w1 += '['
      @w2 += '['

      return true
    end

    def diff_end
      @w1 += ']'
      @w2 += ']'

      return false
    end

    def diff s1, s2
      word1 = self.string_to_h s1
      word2 = self.string_to_h s2

      diff = false

      @w1 = ''
      @w2 = ''

      loop do
        break if word1.empty? or word2.empty?

        unless word1.first == word2.first
          unless diff
            diff = diff_start
          end

          if word1.size > word2.size
            @w1 += word1.shift
          else
            @w2 += word2.shift
          end
          next
        end

        if diff
          diff = diff_end
        end

        @w1 += word1.shift
        @w2 += word2.shift
      end

      unless word1.empty?
        unless diff
          diff = diff_start
        end
        @w1 += word1.join
      end

      unless word2.empty?
        unless diff
          diff = diff_start
        end
        @w2 += word2.join
      end

      if diff
        diff = diff_end
      end

      @w1 = CE.pickup(/\[.*?\]/, :h_red).get(@w1)
      @w2 = CE.pickup(/\[.*?\]/, :h_red).get(@w2)

      return @w1, @w2
    end
  end
end

