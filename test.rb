require './app'

calc = Calculator.new

while true do
  puts "コイン又は紙幣（10, 50, 100, 500, 1000）を入れてください（購入に進むにはexitと入力して下さい）"
  coin = gets.chomp
  if coin == "exit"
    break
  else
    coin = coin.to_i
    calc.insert(coin)
    puts "投入金額︰#{calc.total}"
  end
end
