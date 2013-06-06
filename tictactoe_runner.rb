require "./tictactoe.rb"

class Tictactoe_runner

	def self.run
		@game = Tic_tac_toe.new
		@game.draw_board
		until @game.counter == 10
			@game.question_player(@game.whose_turn)
			if @game.win?
				puts ""
				puts " * * * #{@game.current_player} wins! * * * ".rjust(20)
				puts ""
				break
			end
			@game.counter += 1	
		end
	p "draw game . . ." if @game.counter == 10
	end

end

Tictactoe_runner.run
