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

puts '4.4.1 map/collect'
# 各要素を変更する
numbers = [1, 2, 3, 4, 5]
numbers_doubled = numbers.map { |n| n * 2 }
pp numbers          # [1, 2, 3, 4, 5]
pp numbers_doubled  # [2, 4, 6, 8, 10]

puts '4.4.2 select/find_all/reject'
# 特定の要素だけ取り出す/除外する
numbers = [1, 2, 3, 4, 5]
numbers_even = numbers.select { |n| n.even? }
pp numbers_even # [2, 4]

puts '4.4.3 find/detect'
# 戻り値が真である最初の値を返す
numbers = [1, 2, 3, 4, 5]
first_even_number = numbers.find { |n| n.even? }
pp first_even_number  # 2

puts '4.4.4 sum'
# 要素の合計を求める
numbers = [1, 2, 3, 4, 5]
numbers_sum = numbers.sum
pp numbers_sum  # 15

puts '4.4.5 &とシンボルを使ってもっと簡潔に書く'
# ブロック内を簡潔に書く記法
# 使える場面: ブロックパラメータに、引数のないメソッドを1回呼び出すだけ
languages = ['ruby', 'python', 'java']

# 以下の2つの式は等価
pp languages.map { |s| s.upcase }  # ["RUBY", "PYTHON", "JAVA"]
pp languages.map(&:upcase)         # ["RUBY", "PYTHON", "JAVA"]


puts '4.5 範囲 (Range)'
# 最初の値..最後の値  (最後の値を含む)
# 最初の値...最後の値 (最後の値を含まない)
1..5
1...5
'a'..'e'
'a'...'e'


puts '4.5.1 配列や文字列の一部を抜き出す'
a = [1, 2, 3, 4, 5]
pp a[1..3]   # [2, 3, 4]
pp a[1...3]  # [2, 3]

puts '4.5.2 n以上m以下, n以上m未満の判定をする'
pp (0...100).include?(100)  # false

puts '4.5.3 case文で使う'
age = 25
pp case age 
when 0..20
  'children'
when 20..65
  'working people'
else
  'elder people'
end  # "working people"


puts '4.5.4 値が連続する配列を作成する'
pp (1..5).to_a        # [1, 2, 3, 4, 5]
pp (1...5).to_a       # [1, 2, 3, 4]
pp ('a'..'e').to_a    # ["a", "b", "c", "d", "e"]
pp ('a'...'e').to_a   # ["a", "b", "c", "d"]

# 同様の操作は[]と*で書ける
pp [*1..5]   # [1, 2, 3, 4, 5]
pp [*1...5]  # [1, 2, 3, 4]


puts '4.5.5 繰り返し処理を行う'
sum = 0
(1..5).each { |n| sum += n }
pp sum  # 15

# stepメソッドで間隔を指定できる
sum = 0
(1..5).step(2) { |n| sum += n }
pp sum  # 9


puts '4.7 配列についてもっと詳しく'
# 要素の取り出し: 配列[位置, 取得する長さ]
a = [1, 2, 3, 4, 5]
pp a[0, 3]    # [1, 2, 3]
pp a.first(3) # [1, 2, 3]

# 取得したい要素の添字を複数指定する
a = [1, 2, 3, 4, 5]
pp a.values_at(0, 2, 4)  # [1, 3, 5]

# 最後の要素を取得する
a = [1, 2, 3, 4, 5]
pp a[-1]      # 5
pp a[-3, 3]   # [3, 4, 5]
pp a.last     # 5
pp a.last(3)  # [3, 4, 5]


puts '4.7.2 さまざまな要素の変更方法'
# 要素の置き換え
a = [1, 2, 3, 4, 5]
a[0, 2] = 0  # 最初から2つまでの要素を0にする 
pp a         # [0, 3, 4, 5] 

# 要素の追加
a = [1, 2, 3, 4, 5]
pp a << 6     # [1, 2, 3, 4, 5, 6]
pp a.push(7)  # [1, 2, 3, 4, 5, 6, 7]

# 要素の削除
a = [1, 2, 3, 4, 5]

a.delete(5)
pp a  # [1, 2, 3, 4]
a.delete_at(0)
pp a  # [2, 3, 4]


puts '4.7.3 配列の連結'
a = [1]
b = [2, 3]
pp a.concat(b)  # [1, 2, 3]
pp a            # [1, 2, 3] (concatは破壊的メソッド)

a = [1]
b = [2, 3]
pp a + b        # [1, 2, 3] 
pp a            # [1]       (+演算子は非破壊的メソッド)


puts '4.7.4 配列の和集合・差集合・積集合'
# 和集合
a = [1, 2, 3]
b = [3, 4, 5]
pp a | b  # [1, 2, 3, 4, 5]

# 差集合
a = [1, 2, 3]
b = [3, 4, 5]
pp a - b  # [1, 2]

# 積集合
a = [1, 2, 3]
b = [3, 4, 5]
pp a & b  # [3]

# 集合を扱うより効率的なクラス: Setクラス
require 'set'
a = Set[1, 2, 3]
b = Set[3, 4, 5]
pp a | b  # #<Set: {1, 2, 3, 4, 5}>
pp a - b  # #<Set: {1, 2}>
pp a & b  # #<Set: {3}>


puts '4.7.5 多重代入で残りの全要素を受け取る・無視する'
# 変数の前にアスタリスクをつけることで、要素を配列として受け取る
e, *f = 1, 2, 3
pp e  # 1
pp f  # [2, 3]

e, * = 1, 2, 3
pp e  # 1


puts '4.7.6 配列を展開する'
# pushは複数の引数をとることができたが...
a = [1]
b = [2, 3]
pp a.push(2, 3)  # [1, 2, 3]

# 配列を展開して、複数の引数として渡すことができる
a = [1]
b = [2, 3]
pp a.push(*b)    # [1, 2, 3]


# case文のwhen節で条件に使える
jp = ['japan', '日本']
us = ['usa', 'アメリカ']
country = '日本'
pp case country
when *jp          # 配列を展開したものを使っている
  'こんにちは'
when *us          # 配列を展開したものを使っている
  'Hello'
end  # "こんにちは"


puts '4.7.8 配列同士を非破壊的に連結する'
a = [1, 2, 3]
pp [0, *a, 4, 5]  # [0, 1, 2, 3, 4, 5]


puts '4.7.9 ==で等しい配列かどうかを判断する'
pp [1, 2, 3] == [1, 2, 3]  # true
pp [1, 2, 3] == [1, 2]     # false


puts '4.7.10 %記法で文字列の配列を簡潔に作る'
pp ['apple', 'melon', 'orange']  # ["apple", "melon", "orange"]
pp %w!apple melon orange!        # ["apple", "melon", "orange"]
pp %w(apple melon orange)        # ["apple", "melon", "orange"]
pp %w(
  apple
  melon
  orange
)                                # ["apple", "melon", "orange"]

# 空白文字を含めたい場合はバックスラッシュを使ってエスケープする
pp %w!This\ is\ an\ apple This\ is\ a\ melon This\ is\ an\ orange!  # ["This is an apple", "This is a melon", "This is an orange"]

# 式展開やタブ(\t)、改行(\n)を含めたい場合は%Wを使う
this_is = "This is"
pp %W!#{this_is}!  # ["This is"]
pp %W!an\napple!   # ["an\n" + "apple"]


puts '4.7.11 文字列を配列に変換する'
pp 'Ruby'.chars             # ["R", "u", "b", "y"]
pp 'A, B, C'.split(", ")    # ["A", "B", "C"]


puts '4.7.12 配列にデフォルト値を設定する'
# Array.new(長さ, デフォルト値)
pp Array.new                    # []
pp Array.new(5)                 # [nil, nil, nil, nil, nil]
pp Array.new(5, 0)              # [0, 0, 0, 0, 0]

# ブロックを渡してデフォルト値を決められる
# ブロックパラメータは添字が渡される
pp Array.new(5) { |n| n % 3 }   # [0, 1, 2, 0, 1]


puts '4.7.13 配列にデフォルト値を設定する場合の注意点'
# デフォルト値は全て同じオブジェクトを参照している
pp a = Array.new(5, 'default')      # ["default", "default", "default", "default", "default"]
pp a[0].upcase!                     # "DEFAULT"
pp a                                # ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]

# 対策: ブロックからデフォルト値を渡す
pp a = Array.new(5) { "default" }   # ["default", "default", "default", "default", "default"]
pp a[0].upcase!                     # "DEFAULT"
pp a                                # ["DEFAULT", "default", "default", "default", "default"]

puts '4.7.14 ミュータブル・イミュータブル'
# Stringクラスはミュータブルなので、上述の問題が起きてしまった
pp a = Array.new(5, 'default')      # ["default", "default", "default", "default", "default"]
pp a[0].upcase!                     # "DEFAULT"
pp a                                # ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]

# 数値、シンボル、true/false, nil, Rangeなどはイミュータブルなので、そのような問題は起きない
pp a = Array.new(5, 0)   # [0, 0, 0, 0, 0]
pp a[0] = 1              # 1
pp a                     # [1, 0, 0, 0, 0]


puts '4.8 ブロックについてもっと詳しく'

puts '4.8.1 添字付きの繰り返し処理'
# each_with_indexメソッドを使う
fruits = ['apple', 'melon', 'orange']
fruits.each_with_index { |fruit, i| puts "#{i}: #{fruit}"}
# 0: apple
# 1: melon
# 2: orange

puts '4.8.2 with_indexメソッドを使った添字付きの繰り返し処理'
# each, map, delete_ifなどの繰り返し処理を使うメソッドはEnumeratorオブジェクトを返す
# with_indexはEnumeratorクラスのインスタンスメソッド
fruits = ['apple', 'melon', 'orange']
pp fruits.map.with_index { |fruit, i| "#{i}: #{fruit}"}  # ["0: apple", "1: melon", "2: orange"]
pp fruits.delete_if.with_index { |fruit, i| i.odd? }     # ["apple", "orange"]

puts '4.8.4 配列がブロックパラメータに渡される場合'
dimensions = [
  #縦  横  
  [10, 20],
  [20, 30],
]

# 配列として受け取ることもできる
areas = []
dimensions.each do |dimension|
  length = dimension[0]
  width  = dimension[1]
  areas << length * width
end
pp areas  # [200, 600]

# 個別に受け取ることもできる
areas = []
dimensions.each { |length, width| areas << length * width }
pp areas  # [200, 600]


puts '4.8.5 番号指定パラメータ'
# _1 ~ _9までの番号指定パラメータで、ブロックパラメータの引数を受け取れる
# 通常の書き方
pp ['japan', 'us', 'italy'].map.with_index { |country, n| [n, country] }  # [[0, "japan"], [1, "us"], [2, "italy"]]
# 番号指定パラメータを使った書き方
pp ['japan', 'us', 'italy'].map.with_index { [_2, _1] }                   # [[0, "japan"], [1, "us"], [2, "italy"]]


puts '4.8.7 繰り返し処理以外でも使用されるブロック'
# 例: ファイルに文字列を書き込む
# ファイルのオープン、クローズが自動で行われる
File.open('./sample.txt', 'w') do |file|
  file.puts("1行目")
  file.puts("2行目")
  file.puts("3行目")
end


puts '4.8.8 do...endと{}の結合度の違い'
# {}で囲まれた処理の結合度は高い

a = []

# aの添字に100がないので、"NG"が返る
pp (a.delete 100 do "NG" end)   # "NG"

# 同様の処理を{}で書き換える
# 以下のコードだと、a.delete 100 ではなく 100 { "NG" } が先に処理されてしまい、エラーとなる
# pp a.delete 100 { "NG" }

# 以下のように()で引数を囲めばコードは動く
pp (a.delete(100) { "NG" })     # "NG"


puts '4.9 範囲(Range)についてもっと詳しく'

puts '4.9.1 終端や始端を持たない範囲オブジェクト'
pp (10..)    # 10..
pp 10..nil   # 10..
pp (..10)    # nil..10
pp nil..10   # nil..10
pp nil..nil  # nil..


puts '4.10 様々な繰り返し処理'

puts '4.10.1 timesメソッド'
# 単にn回処理を行いたい場合はtimesメソッドを使う
sum = 0
5.times { |n| sum += n }
pp sum  # 10

puts '4.10.2 uptoメソッドとdowntoメソッド'
a = []
10.upto(14) { |n| a << n }
pp a   # [10, 11, 12, 13, 14]

a = []
14.downto(10) { |n| a << n }
pp a   # [14, 13, 12, 11, 10]

puts '4.10.3 stepメソッド'
# 開始値.step(上限, ステップ値)
a = []
1.step(10, 2) { |n| a << n }
pp a  # [1, 3, 5, 7, 9]


puts '4.10.4 while文とuntil文'
# while文
a = []
while a.size < 5
  a << 1
end
pp a  # [1, 1, 1, 1, 1]

# 1行で書く方法
a = []
a << 1 while a.size < 5
pp a  # [1, 1, 1, 1, 1]

# 最低1回処理を実行する: begin ... end
a = []
begin
  a << 1
end while false
pp a  # [1]

# until文: while文と条件が逆になる
a = []
begin
  a << 1
end until true
pp a  # [1]


puts '4.10.5 for文'
# eachメソッドやmapメソッドを使うため、for文はほとんど使われない
numbers = [1, 2, 3]
sum = 0
for n in numbers
  sum += n
end
pp sum  # 6


puts '4.10.6 loopメソッド'
# あえて無限ループを作りたい場合に使う
loop do
  puts "loop"  # loop
  break        # 脱出
end


puts '4.11 繰り返し処理用の制御構造'
# break
# next
# redo

puts '4.11.1 break'
# 繰り返し処理を脱出する
loop do
  puts "loop"  # loop
  break        # 脱出
end

puts '4.11.2 throwとcatchを使った大域脱出'
# 入れ子になっているループの一番外のループまで脱出したい場合
# ※ throwとcatchは例外処理とは関係ない
catch :done do              # シンボルを指定
  loop do
    puts "outer loop"
    loop do
      puts "inner loop"
      throw :done           # 指定したシンボルで脱出
    end
    puts "still in the loop"
  end
end


puts '4.11.4 next'
# 次の繰り返し処理へ進む (pythonでのcontinue)
numbers = [1, 2, 3]
odd_numbers = []

numbers.each do |n|
  next if n.even?
  odd_numbers << n
end

pp odd_numbers  # [1, 3]


puts '4.14.5 redo'
# 繰り返し処理を、その回の最初からやり直す
# 無限ループに注意
fruits = ['apple', 'melon', 'orange']
fruits.each do |fruit|
  puts "Do you like #{fruit}"
  answer = ['yes', 'no'].sample
  puts answer
  redo unless answer == 'yes'
end

