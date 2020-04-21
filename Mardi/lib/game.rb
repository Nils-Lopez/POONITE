class Game
	attr_accessor :human_player, :enemies
	@enemies = []

	def initialize(human_name, nb_enemies = 4)
		@human_player = HumanPlayer.new(human_name)
		@enemies = []
		nb_enemies.times do |n|
			@enemies << Player.new("Bot#{n}")
		end
	end

	def kill_player(player)
		@enemies.delete(player)
	end

	def is_still_ongoing?
		if @human_player.life_points > 0 && @enemies.size > 0
			return true
		else
			return false
		end
	end

	def show_players
		@human_player.show_state
		@enemies.each do |bot|
			if bot.life_points > 0
				nb += 1
			end
		end
		puts "Il reste #{nb} bots"
	end

	def menu
		puts "Quelle action veux-tu effectuer ?"
		puts "a - chercher une nouvelle arme"
		puts "s - chercher à se soigner"
		puts "attaquer un joueur en vie :"
		ind = 0
		@enemies.each do |bot|
			if bot.life_points > 0
				puts "#{ind} - #{bot.name} a encore #{bot.life_points} point(s) de vie"
			end
			ind += 1
		end
		print ">"
	end

	def menu_choice(action)
		puts "========================================="
		if action == "a"
			@human_player.search_weapon 
		elsif action == "s"
			@human_player.search_health
		elsif action.scan(/\D/).empty?
			i = 0
			@enemies.each do |bot|
				puts (action.to_i == i)
				if action.to_i == i
					@human_player.attacks(bot)
					if bot.life_points < 1
						kill_player(bot)
					end
				else
					i += 1
				end
			end
		else
			puts "#{action} n'est pas une commande possible"
		end
	end

	def enemies_attack
		puts "========================================="
		puts "Maintenant les autres joueurs t'attaquent"
		@enemies.each do |bot|
			bot.attacks(@human_player)
			puts "-----------------------------------------"
		end
	end

	def end_game 
		puts "La partie est finie"
		if @human_player.life_points > 0 
			puts "Bravo tu as gagné !"
		else 
			puts "Loser !! Tu as perdu"
		end
	end

end