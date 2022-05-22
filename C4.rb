puts "4.2 配列"

pp [].class  # Array

# 配列の作成
[1, 2, 3]

[
  1,
  2,
  3,  # 最後の項目に , をつけてもよい
] 

["apple", 2, "orange", 4]  # データ型が異なっていても良い

[[1, 2], [3, 4]]  # 配列の中に配列を作っても良い


puts '配列の参照'
a = [1, 2, 3]
pp a[0]   # 1
pp a[1]   # 2
pp a[2]   # 3
pp a[100] # nil  (存在しない要素にはnilが返る)

puts '配列の長さ'
pp a.size    # 3
pp a.length  # 3


puts '4.2.1 要素の変更、追加、削除'

puts '変更'
a = [1, 2, 3]
a[0] = -1
pp a  # [-1, 2, 3]

puts '追加'
# indexを使った追加
a = [1, 2, 3]
a[4] = 5
pp a  # [1, 2, 3, nil, 5] (間の値はnilで埋められる)

# << を使った追加
a << 6
pp a  # [1, 2, 3, nil, 5, 6]

puts '削除'
# indexを指定した削除
a = [1, 2, 3]
a.delete_at(0)
pp a  # [2, 3]


puts '4.2.2 配列を使った多重代入'
a, b = [1, 2]
pp a  # 1
pp b  # 2

# 配列に過不足があると、過不足な変数に nil が返る
a, b = [1]
pp a  # 1
pp b  # nil

a, b, c = [1, 2]
pp a  # 1
pp b  # 2
pp c  # nil

# divmodなど、返り値が配列であるメソッドを受け取るときに使う
quotient, remainder = 14.divmod(3)  # 14割る3 は 4 余り2
pp quotient   # 4
pp remainder  # 2


puts '4.3 ブロック'
# メソッドの引数として渡せる処理
# do から endまで または { から } まで
# |ここの変数をブロックパラメータと呼ぶ|

puts '4.3.2 Rubyの繰り返し処理'
# Rubyではfor文をほとんど書かない
# 代わりにeachメソッドを使う

numbers = [1, 2, 3]
sum = 0
numbers.each do |n|
  sum += n
end
pp sum  # 6


puts '4.3.5 do ... end と {}'
# * 改行を含むときは do ... end
# * 一行で書くときは {}


puts '4.4 ブロックを使う配列のメソッド'


