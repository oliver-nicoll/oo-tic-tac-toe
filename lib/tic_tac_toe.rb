require "pry"
class TicTacToe
   
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
        ]
    
    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end
   
 
    def display_board
        #board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(input, player)
        #board[index.to_i - 1] = token
        @board [input.to_i] = player
    end

    def position_taken?(index)
        if @board[index] == "X" || @board[index] == "O"
          true
        else 
            false
        end
    end

    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
         # if the position isnt taken and is on the board, move must be valid
    end
    
    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        user_input = gets.chomp
        position = input_to_index(user_input)
        if valid_move?(position)
            move(position, current_player)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.each {|win_combo|
          index_0 = win_combo[0]
          index_1 = win_combo[1]
          index_2 = win_combo[2]
      
          position_1 = @board[index_0]
          position_2 = @board[index_1]
          position_3 = @board[index_2]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combo
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
          end
        }
        return false
      end


    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end

    def draw?
        if !won? && full?
            return true
        else
            false
        end
    end

    def over?
        if won? || draw?
            return true
        else
            false
        end
    end

    def winner
        index = []
        index = won?
        if index == false
            return nil
        else
            if  @board[index[0]] == "X"
                return "X"
            else
                return "O"
            end
        end
    end

    def play
        until over? == true
            turn
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end


end



# TicTacToe.new #-> New instance --> Object -> An object is an instance of a class.
# TicTacToe.all #=> Class  method- > All. -> array of intance 

# TicTacToe.new.display_board
# TicTacToe.display_board #=> This wont work beacuse its not called on an instance