class GameZone

  attr_accessor :lastValue

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
      @lastValue = "O"
    else
      @@board.sub!(@playerMove, "X")
      @lastValue = "X"
    end
    @@order += 1

  end

  def showBoard
    puts "The current situation of the board is \n"
    puts "#{@@board}"
  end

  def returnBoard
    return "#{@@board}"
  end

  def moves
    @@no_repeater
  end
end

class GameLogics

  @@columnTest = []
  @@rowTest = []
  @@diagonalTest = []
  ROWS = [0,3,6]

  def initialize(board)
    @board = board
    @game_array = board.split(/['|','\n']/)
  end

  def columnAny
    for i in 0...3
      if (@game_array.at(i) === @game_array.at(i+3)) && (@game_array.at(i+3) === @game_array.at(i+6))
        @@columnTest.push(true)
      else
        @@columnTest.push(false)
      end
    end
    @@columnTest.any?{|item| item === true}
  end

  def rowAny
    for i in ROWS
      if (@game_array.at(i) === @game_array.at(i+1)) && (@game_array.at(i+1) === @game_array.at(i+2))
        @@rowTest.push(true)
      else
        @@rowTest.push(false)
      end
    end
    @@rowTest.any?{|item| item === true}
  end

  def diagonalAny
    if ((@game_array.at(0)==@game_array.at(4))&&(@game_array.at(4)==@game_array.at(8)))||((@game_array.at(2)==@game_array.at(4))&&(@game_array.at(4)==@game_array.at(6)))
      @@diagonalTest.push(true)
    else
      @@diagonalTest.push(false)
    end
    @@diagonalTest.any?{|item| item === true}
  end
end

def decider (val1, val2, val3)
  arr = [val1, val2, val3]
  return arr.any? {|item| item === true}
end

puts "This is a simple implementation of tic-tac-toe in ruby"
puts "First player uses 0 and second player uses X"
puts "Enter move:  "
move = gets.chomp
situation = GameZone.new(move)
board = situation.returnBoard
gamePlay = situation.moves
assessor = GameLogics.new(board)
situation.showBoard

while (!(decider(assessor.rowAny, assessor.columnAny, assessor.diagonalAny)) && (gamePlay.length < 8))
  puts "Enter your move:  "
  move = gets.chomp
  situation = GameZone.new(move)
  board = situation.returnBoard
  gamePlay = situation.moves
  assessor = GameLogics.new(board)
  situation.showBoard
end

if (gamePlay.length === 8)
  puts "The game is a draw!"
elsif gamePlay.length.even?
  puts "Second player wins!"
else
  puts "First player wins!"
end
