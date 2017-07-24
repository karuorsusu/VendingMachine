#!/usr/bin/env ruby

class Calculator
  attr :total, :stock, :earnings

  COINS_AVAILABLE = [10, 50, 100, 500, 1000].freeze

  def initialize
    @total = 0
    @earnings = 0
    @stock = []
    coke = Drink.coke
    store(coke)
    puts "いらっしゃいませ〜"
  end

  def store(drink)
    ## もっといい書き方があるはずだが知らない．これだと冗長的すぎる．
    drink_hash = {
      :name => drink.name,
      :price => drink.price,
      :quantity => drink.quantity
    }

    @stock.push(drink_hash)
  end

  def add_other_drinks
    # レッドブルと水を生成
    redbull = Drink.redbull
    water = Drink.water
    # @stock配列に挿入
    store(redbull)
    store(water)
  end

  def stock_info
    @stock.each do |drink|
      puts "#{drink[:name]}: #{drink[:price]}円, 在庫#{drink[:quantity]}個"
    end
  end
  #機能を持たせすぎな気がする
  def insert(coin)
      # coinが整数かどうか（入力を受け取る時は数値か文字列かを指定できないので）
      if coin.to_i != 0 and COINS_AVAILABLE.include?(coin.to_i)
        coin = coin.to_i
        @total += coin
      elsif coin == "refund"  #coinに文字列を代入するのはちょっと違和感があります
        refunds
      elsif coin == "exit"
        puts "購入に進みます"
      # coinが整数で使えないお金のとき
      elsif coin.to_i != 0 and coin.to_i == 1 or 5 or 2000 or 5000 or 10000
        coin = coin.to_i
        puts "#{coin}円は使えません。返金します"
        return coin
      # coin.to_i == 0（文字列or0） だったり，コインの単位でない数字だったとき
      else
        puts "それはお金じゃありません!"
      end
  end

  def refunds
    puts "#{@total}円を返却します"
    total = @total
    @total = 0
    return total
  end

  def buy(drink_name)

    drink_index = get_drink_index(drink_name)
# stockの構造が少しややこしいです
    if can_you_buy_it?(drink_name)
      @total -= @stock[drink_index][:price]　
      @earnings += @stock[drink_index][:price]
      @stock[drink_index][:quantity] -= 1
      return drink_name
    else
      puts "投入金が不足しています"
      return nil
    end
  end

  def get_drink_index(drink_name)
    # drink_name にあう@stock配列のインデックスを取得
    i = 0
    while true
      if drink_name == @stock[i][:name]
        drink_index = i
        break
      end
      i += 1
    end
    return drink_index
  end

  def can_you_buy_it?(drink_name)
    drink_index = get_drink_index(drink_name)
#if文の条件分岐が長くて読みにくく感じます
    if @total >= @stock[drink_index][:price] and @stock[drink_index][:quantity] > 0
      true
    else
      false
    end
  end

  def list_of_drinks_you_can_buy
    list = []
    @stock.each do |drink|
      if can_you_buy_it?(drink[:name])
        list.push(drink)
      end
    end
    return list
  end
end

class Drink
  attr :name, :price, :quantity

  def initialize(name, price, quantity)
    @name = name; @price = price; @quantity = quantity
  end

  # それぞれの決まったドリンクのオブジェクトを生成するためのクラスメソッドを定義
  def self.coke
    self.new("coke", 120, 5)
  end

  def self.redbull
    self.new("redbull", 200, 5)
  end

  def self.water
    self.new("water", 100, 5)
  end
end
