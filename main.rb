require './vendingmachine'

"""
[自動販売機アプリ]
 * 在庫リストは客には必要ないのでmain.rbでは表示しない（購入可能リストのみ）
 * １本購入したら釣り銭返却処理

"""

# 計算機インスタンスを生成
calc = Calculator.new

# レッドブルと水を追加する時はコメントを外す
calc.add_other_drinks

# 全ドリンクリスト
puts "<飲み物リスト>"
calc.stock.each do |drink|
  if drink[:quantity] != 0
    puts "#{drink[:name]}: #{drink[:price]}円"
  end
end
puts ""


# お金の挿入処理
while true do
  puts "コイン又は紙幣（10, 50, 100, 500, 1000）を入れてください（購入に進むにはexitと入力して下さい）"
  coin = gets.chomp
  calc.insert(coin)
  if coin == 'exit'
    break
  end
  puts "投入金額︰#{calc.total}"
  puts "----------------------------------------------------------------------------------"
end

# 購入可能リスト
puts "購入可能なドリンクのリストは以下です．購入するドリンクの名前を入力して下さい"
list = calc.list_of_drinks_you_can_buy
list.each do |drink|
  puts "#{drink[:name]}: #{drink[:price]}円"
end

# 購入処理

puts "購入する飲み物の名前を入力して下さい"
drink_name = gets.chomp
calc.buy(drink_name)
calc.refunds
