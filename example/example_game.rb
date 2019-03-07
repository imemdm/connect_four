require_relative "../lib/connect_four.rb"

emil = ConnectFour::Player.new(name: "Emil", color: "x")
npc = ConnectFour::Player.new(name: "NPC", color: "o")

players = [emil, npc]

ConnectFour::Game.new(players).play