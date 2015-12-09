module Diff
  class << self
    def string_to_h s
      a = {}
      i = 0
      s.each_char do |c|
        a[i] = c
        i += 1
      end

      return a
    end

    def diff s1, s2
      word1 = self.string_to_h s1
      word2 = self.string_to_h s2

      i = 0
      j = 0
      diff = false
      w1 = ''
      w2 = ''
      loop do
        break if word1[i].nil? or word2[j].nil?

        unless word1[i] == word2[j]
          unless diff
            w1 += '['
            w2 += '['
            diff = true
          end

          if word1.size > word2.size
            w1 += word1[i]
            word1.delete i
            i += 1
          else
            w2 += word2[j]
            word2.delete j
            j += 1
          end
          next
        end

        if diff
          w1 += ']'
          w2 += ']'
          diff = false
        end

        w1 += word1[i]
        w2 += word2[j]
        word1.delete i
        word2.delete j
        i += 1
        j += 1
      end

      word1.each do |k,c|
        w1 += c
      end

      word2.each do |k,c|
        w2 += c
      end

      if diff
        w1 += ']'
        w2 += ']'
      end

      return w1, w2
    end
  end
end

