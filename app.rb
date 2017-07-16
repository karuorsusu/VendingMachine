#!/usr/bin/env ruby



class Calculator
  attr :total

  COINS_AVAILABLE = [10, 50, 100, 500, 1000].freeze

  def initialize
    @total = 0
  end

  def insert(coin)
    while true do
      if COINS_AVAILABLE.include?(coin)
        @total += coin
      elsif coin == 'exit'
        break
      elsif coin == 1 or 5 or 2000 or 5000 or 10000
        puts "#{coin}は使えません。返金します"
      else
        puts "それはお金じゃありません！"
      end
  end

  def refunds
    puts "#{@total}円をお返しします"
    @total = 0
    puts "返金されました"
  end

end

class Drink
  
end

class VendingMachine

end
