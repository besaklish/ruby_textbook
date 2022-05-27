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
  # スーパークラスと全く同じ処理なら省略できる
  # def initialize(name, price)
  #   super
  # end
end

dvd = DVD.new "Belle", 1000
pp dvd.name  # "Belle"


puts "7.6.6 メソッドのオーバーライド"

