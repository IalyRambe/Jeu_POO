require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "\nVoici l'état de chaque joueur:\n"

player2.show_state
puts " "
player1.show_state
puts " "
puts "\nPassons à la phase d'attaque:\n\n"

while
  player1.life_points > 0 && player2.life_points > 0
  player2.attacks(player1)

  puts "\nVoici l'état de chaque joueur:\n"

  player2.show_state
  puts " "
  player1.show_state
  puts " "


  if player2.life_points <= 0 || player1.life_points <= 0
    then break
  else
    puts "\nPassons à la phase d'attaque:\n\n"
    player1.attacks(player2)
  end

end
