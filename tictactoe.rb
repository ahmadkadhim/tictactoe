class Tic_tac_toe

	attr_accessor :counter, :current_player

	class Already_Chosen_Exception < Exception
	end

	class Invalid_Choice_Exception < Exception
	end

	def initialize
		@board = [[1,2,3],[4,5,6],[7,8,9]]
		@player_one = []
		@player_two = []
		@all_choices = []
		@current_player = ""
		@counter = 1
		@winning_combos = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
	end

	def draw_board
		puts ""
		@board.each { |x| puts x.join(" ").rjust(20) }
		puts ""
	end 

	def question_player(player)
		puts "#{@current_player}: what's your choice?"
		@choice = gets.chomp.to_i
		pick_finder(@choice)
		begin
			error_check
		rescue Invalid_Choice_Exception => e
			puts e.message
			puts ""
			@counter -= 1
		rescue Already_Chosen_Exception => e
			puts e.message
			puts ""
			@counter -= 1
		end
		@all_choices.push(@choice)
		player.push(@choice)
		puts "#{@current_player} has guessed: #{player.join(", ")}"
	end

	def win?
		@winning_combos.each_with_index do | val, index |
			if (@winning_combos[index] - whose_turn).empty?			
				return true
			end
		end
		return false
	end

	def whose_turn
		@counter.odd? ? @current_player = "PLAYER ONE" : @current_player = "PLAYER TWO"
		@counter.odd? ? @player_one : @player_two
	end

	def error_check
		raise Invalid_Choice_Exception.new("invalid choice") if @choice.to_s.length != 1 # ||  @choice.include?(/^1-9/)
		raise Already_Chosen_Exception.new("That's already been chosen! Try again!") if @all_choices.include?(@choice) 
	end

	def pick_finder(pick)
		@board.each_with_index do |val,index|
			outer_index = index
			val.each_with_index do |val,index|
				if pick == val
					@counter.odd? ? @board[outer_index][index] = "x" : @board[outer_index][index] = "o"
				end			
			end
		end
		draw_board
		p "***************************************"
	end

end