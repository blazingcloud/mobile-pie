#template :game_screen

class PieClass
  include Pie
end

$pie = PieClass.new

$pie.instance_eval do
  place start:"You are in a park.  You see trees to the north and a path to the east"
  place trees:"You are in a Japanese garden."
  place river_edge:"The path ends at a river"
  place in_the_river:"You walk into the river and drown."

  start.path trees:north, river_edge:east
  river_edge.path in_the_river:east!

  image start:"/public/images/park.jpg"
  image river_edge:"/public/images/water.jpg"
  image trees:"/public/images/trees.jpg"
end