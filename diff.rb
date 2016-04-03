require 'color_echo/get'

module Diff
  class << self
    def set diff
      return diff if diff.empty?
      diff.map {|d| CE.ch(:red).get(d)}.compact
    end

    def diff a, b
      if a.class == Array
        a, b = is_array a, b
      else
        a, b = is_string a, b
      end

      [a, b]
    end

    def is_array a, b
      @word1 = a
      @word2 = b
      a, b = check
      print a.join(','), b.join(',')
    end

    def string_to_a var
      return [] if var.nil?
      return var.chars.to_a
    end

    def is_string a, b
      @word1 = string_to_a a
      @word2 = string_to_a b
      a, b = check
      print a.join, b.join
    end

    def check
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

    def print a, b
      puts "A: #{a}"
      puts "B: #{b}"
    end
  end
end

