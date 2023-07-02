module GameOfLife
  class MainWindow < Chingu::Window
    def initialize
      super(1600, 900, false)

      # To use the Fidgit features, a Fidgit::GuiState must be active.
      push_game_state MainGuiState
    end
  end
end