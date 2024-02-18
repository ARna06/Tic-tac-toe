class GameZone
  attr_accessor :playerMove

  @@board = "1|2|3\n4|5|6\n7|8|9\n"
  @@order = 0

  def initialize(playerMove)
    @playerMove = playerMove
    if @@order.even?
      @@board.sub!(@playerMove, "O")
    else
      @@board.sub!(@playerMove, "X")
    end
    @@order += 1
  end

  def showBoard
    puts "The current situation of the board is \n"
    puts "#{@@board}"
  end
end

for x in 0...2
  puts "Enter your move: \t"
  move = gets.chomp
  situation = GameZone.new(move)
  situation.showBoard
end
