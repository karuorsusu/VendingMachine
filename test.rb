require './vendingmachine'

calc = Calculator.new
calc.add_other_drinks

# 在庫リスト
calc.stock_info
puts ""

# 140円入金してみる
calc.insert(100)
4.times {
  calc.insert(10)
}

puts "投入金額︰#{calc.total}円"
puts ""


# 購入可能リスト
puts "購入可能なドリンクのリストは以下です．購入するドリンクの名前を入力して下さい"
list = calc.list_of_drinks_you_can_buy
list.each do |drink|
  puts "#{drink[:name]}: #{drink[:price]}円"
end

drink_name = gets.chomp
calc.buy(drink_name)
calc.refunds

puts "売上：#{calc.earnings}円"




# # 購入処理
# calc.buy(1)
# # 在庫確認
# calc.stock_info
# puts calc.total
