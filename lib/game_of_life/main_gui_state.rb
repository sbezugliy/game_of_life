module GameOfLife
  class MainGuiState < Fidgit::GuiState
    def initialize
      super

      # Create a vertically packed section, centred in the window.
      vertical align_v: :top, align_h: :left do
        # Create a label with a dark green background.
        my_label = label "Game Of Life", background_color: Gosu::Color.rgb(0, 100, 0)

        vertical do
          horizontal do
            slider = slider(width: 500, range: 1..9, value: 5, tip: "Number of seedlings") do |sender, value|
              @discrete_label.text = "Seedlings: #{value}"
            end
            
            ::GameOfLife::Presets.seedlings = slider.value
            
            @discrete_label = label "Seedlings: #{::GameOfLife::Presets.seedlings}"
          end

          horizontal do
            slider = slider(width: 500, range: 0..10000, value: 200, tip: "Delay between seedings") do |sender, value|
              @continuous_label.text = "Seeding rate #{value}"
            end
            
            ::GameOfLife::Presets.delay = slider.value

            @continuous_label = label "Seeding rate #{::GameOfLife::Presets.delay}"
          end
        end

        # Create a button that, when clicked, changes the label.
        button("Start", align_h: :center, tip: "Press start to see game.") do
          
        end
      end
    end
  end
end