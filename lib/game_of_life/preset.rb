require 'singleton'

module GameOfLife
  class Game
    include Singleton
    
    class << self
      attr_accessor :seedlings, :delay, :size_of_cell, :ttl
      
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