require 'opengl'
require 'glu'
require 'glut'

module GameOfLife
  class Seed
    include Gl,Glu,Glut
    
    attr_accessor :ttl
    
    def initialize(position_x, position_y, ttl=(3..3))
      @position_x = position_x
      @position_y = position_y
      @ttl = rand(ttl)
    end
    
    def pass_day
      if (@ttl > 0)
        @ttl -= 1 
      else
        ::GameOfLife::Game.annihilate(@position_x, @position_y)
      end
    end
  end
end