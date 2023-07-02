require 'singleton'

module GameOfLife
  class Game
    include Singleton
    
    class << self
      attr_accessor :world
      
      def set_field
        @field = []
      end
      
      def <<(seed)
        unless cell_free?(seed.position_x, seed.position_y)
          @world << seed
        end
      end
      
      def next_day
        @world.each do |cell|
           cell.pass_day unless cell.nil?
           spawn(cell.position_x, cell.position_y) unless cell.nil?
        end
      end
      
      def annihilate(position_x, position_y)
        @world[position_x, position_y] = nil
      end
      
      def spawn(seeder_x, seeder_y, count = Presets.seedlings)
        @seeded = 0
        neighbor_cells(seeder_x, seeder_y).each do |neighbor_cell|
          if cell_free?(seed.position_x, seed.position_y)
            @seeded += 1
            self << Seed.new(*neighbor_cell,  Presets.ttl)
          end
          break if Presets.seedlings == @seeded 
        end
        
      end
      
      def neighbor_cells(center_x, center_y)
        @size_of_cell = Presets.size_of_cell
        [
          [center_x - @size_of_cell, center_y - @size_of_cell],
          [center_x - @size_of_cell, center_y + @size_of_cell],
          [center_x + @size_of_cell, center_y - @size_of_cell],
          [center_x + @size_of_cell, center_y + @size_of_cell],
          
          [center_x, center_y - @size_of_cell],
          [center_x, center_y + @size_of_cell],
          [center_x + @size_of_cell, center_y],
          [center_x - @size_of_cell, center_y]
        ]
      end
      
      def cell_free?(x, y)
        true if (@world[x].nil? && @world[y].nil?)
      end
      
      # def seedlings=(seedlings)
#         @seedlings = seedlings
#       end
#
#       def delay=(delay)
#         @delay = delay
#       end
    end
  end
end