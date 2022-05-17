# 2.2.1 全てがオブジェクト

puts '1'.to_s    # "1"
puts 1.to_s      # "1"
puts nil.to_s    # ""
puts /\d+/.to_s  # "(?-mix:\d+)", `m` is multiline mode, `i` is case insensitive, `x` is extended mode ?


# 2.2.3 文の区切り

puts \
'hello'  # "hello"


# 2.2.4 コメント

# コメント

=begin
RDoc作成用のコメント
複数行書くことも可能

通常コメントは複数行であっても#で書くのが一般的
=end


# 2.2.7 リテラル

# リテラル = ソースコードに直接埋め込める値
123
"hello"
[1, 2, 3]
{'japan' => 'yen', 'us' => 'dollar'}
/\d+/


# 2.2.8 変数の宣言

# 変数はスネークケースで書く
my_variable = 10

# 多重代入
# 配列を返すメソッドで便利な場面がある。読みづらさに繋がるので使用場面は慎重に選ぶ
a, b = 1, 2


# 2.3.1 シングルクオート・ダブルクオート

# シングルクオートはシンプル、ダブルクオートは多機能
puts 'こんにちは\nさようなら'  # こんにちは\nさようなら
puts "こんにちは\nさようなら"  # こんにちは(改行)さようなら

puts 'このお菓子は#{100}円です'  # このお菓子は#{100}円です
puts "このお菓子は#{100}円です"  # このお菓子は100円です

# クオートの中にクオートを使いたい場合
puts 'Don\'t run'  # Don't run
puts "Don\"t run"  # Don"t run


# 2.3.2 文字列の比較

# 文字列の比較はバイト値で行う? エンコーディングを指定しなくてもいいの?
puts 'a'.bytes  # 97
puts 'b'.bytes  # 98
puts 'a' < 'b'  # 


# 2.4 数値

puts 1_000_000  # 1000000

# 整数どうしの割り算では小数点以下が切り捨てられる
puts 1 / 2    # 0
puts 1.0 / 2  # 0.5
puts 1 / 2.0  # 0.5

# ++や--はない
n = 1
# n++ はsyntax error
n += 1
puts n  # 2

# 文字列を数値に変換する
puts '1'.to_f  # 1.0 (float)
puts '1'.to_i  # 1   (integer)

# 丸め誤差
puts 0.1 * 3.0           # 0.30000000000000004
puts 0.1r * 3.0r         # 3/10  (Rationalクラス, 有理数)

puts 0.1 * 3.0   == 0.3  # false
puts 0.1r * 3.0r == 0.3  # true


# 2.5.1 真偽値

# false, nilであれば偽
# それ以外は全て真
if "" then puts '"" is true' end  # "" is true


