puts "7.3 クラスの定義"

# キャメルケースで定義する
class OrderItem
end


puts "7.3.1 オブジェクトの生成とinitializeメソッド"

class User
  def initialize
    puts 'initialized'
  end
end

# 以下の文でinitizlizeメソッドが呼ばれる
User.new  # initialized


puts "7.3.2 インスタンスメソッドの定義"

class User
  def hello
    puts 'hello'
  end
end

user = User.new
user.hello  # hello


puts "7.3.3 インスタンス変数とアクセサメソッド"

# @から始まる変数がインスタンス変数
class User
  def initialize(name)
    @name = name
  end

  def hello
    puts "hello, I am #{@name}."
  end
end

user = User.new "Mike"
user.hello  # hello, I am Mike.


# インスタンス変数は作成前に参照してもエラーにならない
# タイプミスしてもエラーにならないので注意
class User
  def initialize
  end

  def hello
    puts "hello, I am #{@name}."
  end
end

user = User.new
user.hello  # hello, I am .


# インスタンス変数はクラスの外部からアクセスできない
# アクセスにはメソッドを定義する必要がある (ゲッターメソッド)
class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

user = User.new 'Mike'
pp user.name  # "Mike"


# インスタンス変数の変更には末尾に=をつけたメソッドを定義する必要がある (セッターメソッド)
class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end
end

user = User.new 'Mike'
pp user.name  # "Mike"
user.name = "Alice"
pp user.name  # "Alice"



# アクセサメソッド = ゲッターメソッドとセッターメソッドの総称
# アクセサメソッドの定義は省略できる
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

user = User.new 'Mike'
pp user.name  # "Mike"
user.name = "Alice"
pp user.name  # "Alice"


# 読み取り専用には attr_reader
# 書き込み専用には attr_writer
class User
  attr_reader :family_name
  attr_writer :given_name

  def initialize(family_name)
    @family_name = family_name
  end

  def print_name
    puts @given_name + ' ' + @family_name
  end
end

user = User.new "Wonder"
user.given_name = "Stevie"
user.print_name  # Stevie Wonder


# 複数のアクセサメソッドを一行で定義できる
class User
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age  = age
  end
end

user = User.new "Mike", 20
pp user.name  # "Mike"
pp user.age   # 20


puts "7.3.4 クラスメソッドの定義"

# クラスメソッド
# クラスには関係しているが、インスタンス変数は使わないメソッド

# self. を使って定義する
class MyClass
  def self.class_method
  end
end

# class << self を使って定義する
# ネストが深くなってしまうが、複数のクラスメソッドが定義できる
class MyClass
  class << self
    def class_method
    end
  end
end


# 例: create_usersメソッド
class User
  def initialize(name)
    @name = name
  end

  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  def hello
    puts "hello, I am #{@name}"
  end
end

names = ["Alice", "Bob", "Carol"]
users = User.create_users names
users.each do |user|
  user.hello
end
# hello, I am Alice
# hello, I am Bob
# hello, I am Carol


puts "Column メソッドの表記法"
# クラス名#インスタンスメソッド
# クラス名.クラスメソッド
# クラス名::クラスメソッド


puts "7.3.5 定数"

# 必ず大文字で始める
# 
class Product
  DEFAULT_PRICE = 0  # 定義

  def initialize(name, price = DEFAULT_PRICE)  # デフォルトの引数に設定
    @name = name
    @price = price
  end

  def default_price
    DEFAULT_PRICE  # メソッド内でも参照可能
  end
end


# スキップしたけどColumnも役立ちそうだった
# ||= を使ったメモ化や遅延初期化


puts "7.5 selfキーワード"
# メソッド内部で他のメソッドを呼び出すために際に使う
# selfは省略可能だが、明示的にselfをつけても良い

class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def hello
    # selfなし
    puts "Hello, I am #{name}."
  end

  def hi
    # selfあり
    puts "Hi, I am #{self.name}."
  end

  def ciao
    # 直接インスタンス変数にアクセス
    puts "Ciao, I am #{@name}."
  end
end

user = User.new "Mike"
user.hello  # Hello, I am Mike.
user.hi     # Hi, I am Mike.
user.ciao   # Ciao, I am Mike.


puts "7.5.1 selfのつけ忘れで不具合が発生するケース"
class User
  attr_accessor :user

  def initialize(name)
    @name = name
  end

  def rename_to_bob
    name = "Bob"          # ローカル変数nameに値が代入されただけ
  end

  def rename_to_carol
    self.name = "Carol"   # インスタンス変数に値が代入された 
  end
end

user = User.new "Mike"
user.rename_to_bob
pp user.name           # "Mike"   (変更されていない)
user.rename_to_carol
pp user.name           # "Carol"  (変更されている)


puts "7.5.2 クラスメソッドの内部やクラス構文直下のself"
# クラス構文直下・クラスメソッド内部のself: Fooクラス自身を表す
# インスタンスメソッド内部のself        : Fooクラスのインスタンス

class Foo
  puts "クラス構文直下のself: #{self}"  # クラス構文直下のself: Foo

  def self.bar
    puts "クラスメソッド内部のself: #{self}"  # クラスメソッド内部のself: Foo
  end

  def baz
    puts "インスタンスメソッド内部のself: #{self}"  # インスタンスメソッド内部のself: #<Foo:0x000000013b030980>
  end
end

foo = Foo.new
Foo.bar
foo.baz


puts "7.5.3 クラスメソッドをインスタンスメソッドで呼び出す"
# クラス名.メソッド名 　　で　クラスメソッドを呼び出せる
# self.class.メソッド名 でもクラスメソッドを呼び出せる
class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name  = name
    @price = price
  end

  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    formatted_price = Product.format_price(price)
    "name: #{name}, price: #{formatted_price}"
  end
end


puts "7.6 クラスの継承"

puts "7.6.2 デフォルトで継承されるObjectクラス"
# 以下のクラスは中身がないが
class User
  def initialize
  end
end

# 全てのクラスはデフォルトでObjectクラスを継承しているので、
# インスタンスメソッドが呼び出せる
user = User.new
pp user.to_s  # "#<User:0x00000001380288c8>"
pp user.nil?  # false
pp User.superclass  # Object


puts "7.6.3 オブジェクトのクラスを確認する"
# classメソッド
user = User.new
pp user.class  # User

# instance_of?メソッド
user = User.new
pp user.instance_of? User  # true

# 継承関係を調べる
# is_a?メソッド
user = User.new
pp user.is_a? User    # true
pp user.is_a? Object  # true
pp user.is_a? String  # false


puts "7.6.4 他のクラスを継承したクラスを作る"

class Product
end

class DVD < Product  # DVDがサブクラス, Productがスーパークラス
end


puts "7.6.5 superでスーパークラスのメソッドを呼び出す"

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name  = name
    @price = price
  end
end

class DVD < Product
  def initialize(name, price)
    super(name, price)
  end
end

dvd = DVD.new "Belle", 1000
pp dvd.name  # "Belle"


class DVD < Product  
  def initialize(name, price)
    super  # スーパークラスとサブクラスで引数が同じ場合は引数を省略できる
  end
end

dvd = DVD.new "Belle", 1000
pp dvd.name  # "Belle"


class DVD < Product  
  # スーパークラスと全く同じ処理ならメソッドの定義を省略できる
  # def initialize(name, price)
  #   super
  # end
end

dvd = DVD.new "Belle", 1000
pp dvd.name  # "Belle"


puts "7.6.6 メソッドのオーバーライド"

# スーパークラスと同名のメソッドを作ることで処理を上書きできる
class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name  = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_accessor :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  def to_s
    "name: #{name}, price: #{price}, running_time: #{running_time}"
  end 
end

product = Product.new "my_product", 100
pp product.to_s   # "name: my_product, price: 100"

dvd = DVD.new "my_dvd", 100, 1200
pp dvd.to_s       # "name: my_dvd, price: 100, running_time: 1200"


# Columnをスキップ
# 引数名がつかない*, **


puts "7.7 メソッドの可視性"

puts "7.7.1 publicメソッド"
# クラスの外部から呼び出せるメソッド
# initializeメソッド以外のインスタンスメソッドはデフォルトでpublicメソッド
class User
  def hello
    puts 'hello'
  end
end

user = User.new
user.hello  # hello


puts "7.7.2 privateメソッド"
# クラス内部のみで使えるメソッド
# privateキーワード以下がprivateメソッドになる
class User

  private
 
  def hello
    puts 'hello'
  end
end

user = User.new
# user.hello  # C7.rb:482:in `<main>': private method `hello' called for #<User:0x0000000157852660> (NoMethodError)


puts "7.7.3 privateメソッドから先に定義する場合"
class User
  private
  def hello
    puts 'hello'
  end

  public  # publicキーワードの下はpublicメソッドになる
  def hi
    puts 'hi'
  end
end


puts "privateメソッドはサブクラスでも呼び出せる"
# ただしスーパークラスとサブクラスで意図せず同名のメソッドを使ってしまうと、意図しない挙動になるので注意
# サブクラスを書くときはスーパークラスの実装を理解してから (p.285 Columnに詳細あり)

class Product
  def initialize
  end

  private
  def name           # nameはprivateメソッド
    'a product'
  end
end

class DVD < Product
  def initialize
  end

  def to_s
    "name: #{name}"  # nameメソッドをここで呼び出せる
  end 
end

dvd = DVD.new
pp dvd.to_s  # "name: a product"


puts "7.7.5 クラスメソッドをprivateにしたい場合"
# クラスメソッドはprivateキーワードの下に定義してもprivateにならない
# クラスメソッドをprivateにするには以下の2つの方法がある
# * class << self構文を使う
# * private_class_method

# * class << self構文を使う
class User
  class << self

    private  # privateキーワードが使える
    
    def hello
      puts 'hello'
    end
  end
end

user = User.new
# user.hello  # private method `hello' called for #<User:0x00000001250d5dd8> (NoMethodError)


# private_class_methodを使う
class User
  def self.hello
    puts 'hello'
  end

  private_class_method :hello
end

user = User.new
# user.hello  # private method `hello' called for #<User:0x000000012114a218> (NoMethodError)


puts "7.7.6 メソッドの可視性を変えるあれこれ"
# privateキーワードは実際にはシンボルを引数に取るメソッド
class User
  def hello
    puts 'hello'
  end

  def hi
    puts 'hi'
  end

  private :hello, :hi
end

# メソッド定義は式になっており、シンボルを返すことを利用して以下のように書ける
class User
  private def hello  # def hello ... end は :helloというシンボルを返している
    puts 'hello'
  end
end


# アクセサメソッドをprivateメソッドにする方法 (Ruby 3.0より前)
class User
  attr_accessor :name

  private :name, :name=  # privateキーワードでゲッターメソッドとセッターメソッドをprivateにする

  def initialize(name)
    @name = name
  end
end

# アクセサメソッドをprivateメソッドにする方法 (Ruby 3.0以降)
class User
  private attr_accessor :name  # attr_accessorキーワードにprivateをつける

  def initialize(name)
    @name = name
  end
end


puts "7.7.7 protectedメソッド"

# 外部には公開したくないが、同じクラス・サブクラスのレシーバ付きで呼び出せる
class User
  attr_reader :name

  def initialize(name, weight)
    @name   = name    # nameは公開しても良い
    @weight = weight  # weightは公開したくない
  end

  def heavier_than?(other_user)
    other_user.weight < @weight  # weightは公開したくないが、同じUserクラスのインスタンスであれば使ってもよいこととしたい
  end

  protected

  def weight
    @weight
  end
end

alice = User.new "Alice", 50
bob   = User.new "Bob"  , 60
pp alice.heavier_than?(bob)  # false
# pp alice.weight  # protected method `weight' called for #<User:0x000000013c0c3180 @name="Alice", @weight=50> (NoMethodError)


puts "7.8 定数についてもっと詳しく"

# 定数はクラス外から参照可能
class Product
  DEFAULT_PRICE = 100
end

pp Product::DEFAULT_PRICE  # 100


# 定数をprivateにしたい場合: private_constant
class Product
  DEFAULT_PRICE = 100

  private_constant :DEFAULT_PRICE
end

# pp Product::DEFAULT_PRICE  # private constant Product::DEFAULT_PRICE referenced (NameError)


# 定数の定義はクラス構文の直下・トップレベルで行う
# メソッド内では定数を定義できない
class Foo
  def foo
    # BAR = 123  # C7.rb:655: dynamic constant assignment
  end
end


# 配列を定数で定義しつつ、その要素も定数として定義できる
# ※ Rubyの定数定義は式になっている
# pp GREEN = 0  # => 0
class TrafficLight
  COLORS = [
    GREEN  = 0,
    YELLOW = 1,
    RED    = 2
  ]
end

pp TrafficLight::COLORS   # [0, 1, 2]
pp TrafficLight::GREEN    # 0
pp TrafficLight::YELLOW   # 1
pp TrafficLight::RED      # 2


puts "7.8.1 定数と再代入"

# 定数は再代入が可能 (警告は出る)

class Apple
  DEFAULT_PRICE = 0
  DEFAULT_PRICE = 1000
end

pp Apple::DEFAULT_PRICE


# 再代入を防ぎたい場合はfreeze
# freezeしない場合も多い
# * 普通は定数を上書きする人はいないだろうから
# * freezeしてしまうと、その後でメソッドの定義もできなくなるから
class Apple
  DEFAULT_PRICE = 0
  freeze
  # DEFAULT_PRICE = 1000  # can't modify frozen #<Class:Apple>: Apple (FrozenError)
end

pp Apple::DEFAULT_PRICE


puts "7.8.2 定数はミュータブルなオブジェクトに注意する"
# 文字列, Array, Hashなどのミュータブルなオブジェクトは、再代入しなくても値を変えられる
# それを防ぐために、全てのミュータブルなオブジェクトをfreezeさせる方法がある
class Product
  NAMES = ['foo', 'bar', 'baz']
end

# 再代入なしで値を変更する
Product::NAMES[0].upcase!
pp Product::NAMES  # ["FOO", "bar", "baz"]

# それを防ぐために全てfreezeする
class Product
  NAMES = ['foo'.freeze, 'bar'.freeze, 'baz'.freeze].freeze  # この方法か
  NAMES = ['foo', 'bar', 'baz'].map(&:freeze).freeze         # この方法
end

# Product::NAMES[0].upcase!  # can't modify frozen String: "foo" (FrozenError)


puts "7.9 様々な種類の変数"

puts "7.9.1 クラスインスタンス変数"

# インスタンス変数     : クラス.new でオブジェクトを生成した際に、オブジェクトごとに管理される変数
# クラスインスタンス変数: クラス自身が保持しているデータ

class Product
  # クラスインスタンス変数
  @name = 'Product'

  def self.name
    # クラスインスタンス変数
    @name
  end

  def initialize(name)
    # インスタンス変数
    @name = name
  end

  def name
    # インスタンス変数
    @name
  end
end

# クラスインスタンス変数は継承しない
# インスタンス変数は、スーパークラスと同様のものが使える
class DVD < Product
  def initialize(...)
    super(...)
  end
end

product = Product.new 'my_product'
pp Product.name  # "Product"

dvd = DVD.new "my_dvd"
pp DVD.name         # nil       (クラスインスタンス変数は継承しない)


puts "7.9.2 クラス変数"
# @@class_variable で定義

# クラス構文の直下でもインスタンスメソッド内でも同一のクラス変数を参照可能
# サブクラスも同名の変数が使える
class Product
  @@name = 'Product'      # サブクラスでも同名のクラス変数が使えるようになる

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name         # インスタンスメソッド内でも参照可能
  end

  def name
    @@name
  end
end

class DVD < Product
  def self.name
    @@name
  end
end


pp Product.name  # "Product"
pp DVD.name      # "Product"  (サブクラスからでもスーパークラスのクラス変数を参照可能)

product = Product.new "my_product"  # 値を設定し直す
pp product.name  # "my_product"
pp Product.name  # "my_product"
pp DVD.name      # "my_product"


puts "7.9.3 グローバル変数と組み込み変数"

# グローバル変数は$で始まる変数
# どこからでも代入、参照が可能
# 理解しづらいコードの原因となるので、理由がない限り使わない
$program_name = 'Awesome program'

class Program
  def initialize(name)
    $program_name = name  # グローバル変数に代入
  end

  def self.name
    $program_name
  end
end

pp Program.name  # "Awesome program"
program = Program.new "New awesome program"
pp Program.name  # "New awesome program"


# $で始まるいくつの変数は「組み込み変数」「特殊変数」として最初から定義されている
# 例: $stdin, $* ...


puts "7.10 クラス定義やRubyの言語仕様に関する高度な話題"

puts "7.10.1 エイリアスメソッド"
class User
  def initialize 
  end

  def hello
    puts 'hello'
  end

  alias greet hello  # エイリアスの設定
end

user = User.new
user.hello  # hello
user.greet  # hello


puts "7.10.3 入れ子になったクラスの定義"
# クラスの内部にクラスを定義する
# 参照方法: 外側のクラス::内側のクラス
# クラス名の衝突を防ぐために使われることが多い
class User
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new 'B'
pp blood_type.type  # "B"


puts "7.10.4 演算子の挙動を独自に再定義する"
# 演算子の挙動はメソッドとして再定義できるものがある
# 例: ==, |, &, <<, +@, -@,

# 再定義できないものもある
# 例: =, .., ..., not, &&, ||,

class Product
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def ==(other)                                 # ==を再定義する
    other.is_a?(Product) && code == other.code  # codeが一致していればtrueを返す
  end
end

product_a      = Product.new 'a'
product_a_dash = Product.new 'a'
product_b      = Product.new 'b'

pp product_a == product_a_dash # true
pp product_a == product_b      # false


