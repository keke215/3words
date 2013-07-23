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
  end
}

# 表の大きさ
length = 15

table = Array.new(length){ Array.new(length) }

table[0][0] = words.shift

for i in 1...length
  while true
    tmp = words.shift
    unless (idiom.index(table[0][i-1]+tmp))
      table[0][i]=tmp
      break
    else
      words << tmp
    end
  end
end

for i in 1...length
  while true
    tmp = words.shift
    word1 = idiom.index(table[i-1][0]+tmp)
    word2 = idiom.index(tmp+table[i-1][0])
    unless (word1||word2)
      table[i][0]=tmp
      break
    else
      words << tmp
    end
  end
  
  for j in 1...length
    while true
    tmp = words.shift
    word1 = idiom.index(table[i-1][j]+tmp)
    word2 = idiom.index(tmp+table[i-1][j])
    word3 = idiom.index(table[i][j-1]+tmp)
    word4 = idiom.index(tmp+table[i][j-1])
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








