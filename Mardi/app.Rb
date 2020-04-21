require 'bundler'
Bundler.require


require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

	def start_fight(player1, player2)
		p "Aujourd'hui vont s'affronter #{player1.name} et #{player2.name}"
		p "Ils commencent tous les deux avec 10 points de vie"
		p "==============================================================="
		p "3"
		p '2'
		p '1'
		p "THE FIGHT HAS STARTING"
		p "==============================================================="
		num = 1
		while player1.life_points > 0 && player2.life_points > 0 
			
			p "Round #{num}"
			
			player1.attacks(player2)
			if player2.life_points < 1
				p "Féliciations le joueur #{player1.name} a gagné !"
			  p "============================================================"
				break
			end
			player2.attacks(player1)
			if player1.life_points < 1
				p "Féliciations le joueur #{player2.name} a gagné !"
			  p "============================================================"
				break
			end
			p "Voici l'état de nos joueurs :"
			player1.show_state
			player2.show_state
			num += 1
			p "============================================================"
		end
	end

	start_fight(player1, player2)