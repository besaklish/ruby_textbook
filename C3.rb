puts "3.2 Minitestの基本"
# * Rubyと一緒にインストールされている"
# * 学習コストが比較的低い"
# * Railsのデフォルトテスティングフレームワーク"

puts "3.2.1 テストコードの雛形"
# Minitestは test_ で始まるメソッドを実行する

# sample_test.rb
require 'minitest/autorun'
class SampleTest < Minitest::Test
  def test_sample
    # 検証メソッドの例
    assert_equal 'RUBY', 'ruby'.upcase # 等しければOK
    assert 'RUBY' == 'ruby'.upcase     # 真であればOK
    refute 'RUBY' != 'ruby'.upcase     # 偽であればOK
  end
end


puts "3.3.2 プログラム本体とテストコードを分離する"
# ruby-book
# ├── lib
# │   └── sample.rb
# └── test
#     └── sample_test.rb

# sample_test.rb内で、require_relative でコードを読み込む


puts "Column: Minitest以外のテスティングフレームワーク"
# RSpec
# * 独自のDSL(ドメイン固有言語)でテストコードを書く
# * 利用者が多く、日本語の情報も豊富
# * 標準でインストールされていない

# test-unit
# * Minitestと互換性がある
# * 標準でインストールされる
