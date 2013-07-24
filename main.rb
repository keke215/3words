# -*- coding: utf-8 -*-
words = ""
idiom = Array.new

#kanji_list = "kanji.txt"
#kanji_list = "kanji_easy.txt"
kanji_list = "kanji_easy2.txt"

open(kanji_list) {|file|
  words = file.readlines[1]
}
words = words.split("")
words = words.sort_by{rand}

open("uNoun.csv") {|file|
  while l = file.gets
    idiom << l.chomp
    idiom << l.chomp.reverse
  end
}

# 表の大きさ
length = 15

table = Array.new(length){ Array.new(length) }

for i in 0...length
  for j in 0...length
    while true
      tmp = words.shift
      word1 = i==0                  ? false : idiom.index(table[i-1][j]+tmp)
      word2 = j==0                  ? false : idiom.index(table[i][j-1]+tmp)
      word3 = (i==0||j==0)          ? false : idiom.index(table[i-1][j-1]+tmp)
      word4 = (i==0||j==(length-1)) ? false : idiom.index(table[i-1][j+1]+tmp)
      unless (word1||word2||word3||word4)
        table[i][j]=tmp
        break
      else
        words << tmp
      end
    end
  end
end


for i in 0...length
  puts table[i].join
end








