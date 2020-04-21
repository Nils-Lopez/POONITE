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
		action = get_user_choice
		my_game.menu_choice(action)
		my_game.enemies_attack
	end

	my_game.end_game
end

my_game = intro 
perform(my_game)