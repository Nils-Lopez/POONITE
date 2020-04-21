class Player
	attr_accessor :name, :life_points
	
	def initialize(username)
		@name = username
		@life_points = 10

	end	

	def show_state
		if @life_points > 3
			puts "Le joueur #{@name} a encore #{@life_points} point(s) de vie"
		elsif @life_points <= 3 && @life_points > 0
			puts "Attention le joueur #{@name} n'a plus que #{@life_points} point(s) de vie"
		end
	end

	def gets_damage(damages_nb)
		@life_points -= damages_nb
		if @life_points > 0
			puts "#{@name} a perdu #{damages_nb} point(s) de vie, il lui en reste donc #{@life_points}"
		else
			puts "Le joueur #{@name} est mort"
		end
	end

	def attacks(player)
		puts "Le joueur #{self.name} attaque #{player.name}"
		damages_nb = compute_damage
		puts "Il lui inflige #{damages_nb} point(s) de dommages"
		player.gets_damage(damages_nb)

	end	

	def compute_damage
		return rand(1..6)
	end
	
end	

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(username)
		@name = username
		@life_points = 100
		@weapon_level = 1
	end

	def show_state
		if @life_points > 3
			puts "Le joueur #{@name} a encore #{@life_points} point(s) de vie et une arme de niveau #{weapon_level}"
		elsif @life_points <= 3 && @life_points > 0
			puts "Attention le joueur #{@name} n'a plus que #{@life_points} point(s) de vie et une arme de niveau #{weapon_level}"
		end
	end

	def compute_damage
		rand(1..6) * @weapon_level
	end

	def search_weapon
		new_lvl = rand(1..6)
		puts "Tu as trouvé une nouvelle arme de niveau #{new_lvl}"
		if @weapon_level < new_lvl
			@weapon_level = new_lvl
			puts "Bien joué tu as gagné une arme plus puissante !"
		else 
			puts "Malheureusement elle n'est pas plus forte que ton arme actuelle..."
		end
	end

	def search_health
		health_lvl = rand(1..6)
		if health_lvl == 1
			puts "Tu n'as rien trouvé, il faudra repasser."

		elsif health_lvl > 1 && health_lvl < 6
			puts "Félicitations tu as trouvé un pack de +50 points de vie"
			
			if @life_points + 50 <= 100
				@life_points += 50
			else 
				@life_points = 100
			end

		else
			puts "Félicitations tu as trouvé un pack de +80 points de vie"
			
			if @life_points + 80 <= 100
				@life_points += 80
			else 
				@life_points = 100
			end

		end
	end

end