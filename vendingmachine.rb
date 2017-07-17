#!/usr/bin/env ruby

class Calculator
  attr :total

  COINS_AVAILABLE = [10, 50, 100, 500, 1000].freeze

  def initialize
    @total = 0
    @stock = []
    coke = Drink.coke
    store(coke)
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
    @stock.each_with_index do |drink, i|
      puts "#{i}. #{drink[:name]}, #{drink[:price]}円, 在庫#{drink[:quantity]}個"
      return nil
    end
  end

  def insert(coin)
    # while true do
      if COINS_AVAILABLE.include?(coin)
        @total += coin
      elsif coin == "exit"
        puts "終了します"
      elsif coin == 1 or 5 or 2000 or 5000 or 10000
        puts "#{coin}円は使えません。返金します"
        return coin
      else
        puts "それはお金じゃありません!"
      end
    # end
  end

  def refunds
    puts "#{@total}円をお返しします"
    @total = 0
    puts "返金されました"
  end

  def can_you_buyit?(drink)
    self.total >= drink
  end

  def drink_you_can_buy
    return
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
