require 'fidgit'
require "game_of_life/version"
require "game_of_life/presets"
require 'game_of_life/main_window'
require 'game_of_life/main_gui_state'

module GameOfLife
  class Error < StandardError; end
  
  def self.run
    Game.set_field
    Presets.size_of_cell = 2
    Presets.tll = (3..3)
    MainWindow.new.show
  end
end
