require 'bundler'
Bundler.require


require_relative 'lib/player'

def game

	puts " _______________________________________"
	puts "|       Bienvenue sur POONITE !         |"
	puts "|Le but est d'être le dernier survivant!|"
	puts "|_______________________________________|"
	puts "Choisissez votre pseudo"
	print ">"
	human_name = gets.chomp
	player1 = HumanPlayer.new(human_name)
	player2 = Player.new("Josiane")
	player3 = Player.new("José")
	enemies = [player2, player3]

	while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
		player1.show_state
		puts "Quelle action veux-tu effectuer ?"
		puts "a - chercher une nouvelle arme"
		puts "s - chercher à se soigner"
		puts "attaquer un joueur en vie :"
		if player2.life_points > 0
			puts "0 - #{player2.name} a encore #{player2.life_points} points de vie"
		else 
			puts "#{player2.name} est mort(e)" 
		end
		if player3.life_points > 0
			puts "1 - #{player3.name} a encore #{player3.life_points} points de vie"
		else
			puts "#{player3.name} est mort(e)"
		end
		print ">"
		action = gets.chomp
		puts "========================================="
		if action == "a"
			player1.search_weapon 
		elsif action == "s"
			player1.search_health
		elsif action == "0"
			player1.attacks(player2)
		elsif action == "1"
			player1.attacks(player3)
		else
			puts "#{action} n'est pas une commande possible"
		end
		puts "========================================="
		puts "Maintenant les autres joueurs t'attaquent"

		enemies.each do |bot|
			if bot.life_points > 0
				bot.attacks(player1)
				puts "========================================="
			end
		end
	end
	puts "La partie est finie"
	if player1.life_points > 0 
		puts "Bravo tu as gagné !"
	else 
		puts "Loser !! Tu as perdu"
	end
end
game