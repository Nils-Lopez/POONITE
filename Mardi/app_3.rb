require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def get_user_choice
	return gets.chomp
end

def intro
	puts " _______________________________________"
	puts "|       Bienvenue sur POONITE !         |"
	puts "|Le but est d'être le dernier survivant!|"
	puts "|_______________________________________|"
	puts "Choisissez votre pseudo"
	print ">"
	human_name = gets.chomp
	my_game = Game.new(human_name)
	return my_game
end

def perform(my_game)
	while my_game.is_still_ongoing?
		my_game.menu
		action = "z"
		while !action.match?("[as0-#{my_game.enemies.length-1}]")
			puts "Saisis ton choix"
			print ">"
		  action = get_user_choice
		end
		my_game.menu_choice(action)
		if my_game.is_still_ongoing?
			my_game.enemies_attack
		end
	end

	my_game.end_game
end

my_game = intro 
perform(my_game)