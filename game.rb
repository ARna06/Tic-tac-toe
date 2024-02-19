class GameZone
  attr_accessor :playerMove

  @@board = "1|2|3\n4|5|6\n7|8|9\n"
  @@order = 0
  @@no_repeater = []

  def initialize(playerMove)
    @playerMove = playerMove

    if @@no_repeater.include?(playerMove)
      puts "The location is already occupied!"
      puts "Choose another location"
      return
    else
      @@no_repeater.append(@playerMove)
    end

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

class GameLogics
  attr_accessor :board

  def initialize(board)
    @board = board
    @game_array = @board.split(/['|', '\n']/)
  end

  def self.column

  end
end

for x in 0...6
  puts "Enter your move: "
  move = gets.chomp
  situation = GameZone.new(move)
  situation.showBoard
end
