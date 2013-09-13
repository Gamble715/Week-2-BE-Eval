module Tennis
  class Game
    attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Increments the points of the winning player.
    def wins_ball(player_num)
      if player_num == 1
        @player1.record_won_ball! 
      elsif player_num == 2
        @player2.record_won_ball!
      end
    end     
  end

  class Player
    attr_accessor :points, :opponent

    def initialize
      @points = 0
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score
      return 'love' if @points == 0
      return 'fifteen' if @points == 1
      return 'thirty' if @points == 2
      return 'duece' if duece?
      return 'forty' if @points == 3
      return 'advantage' if advantage?
      return 'win' if wins_games
    end

    def wins_game
      if @points == 4 && @opponent.points < 3 || @points >= 3 && @opponent.points == (@points - 2)
        puts "You win."
      elsif @opponent.points == 4 && @points < 3 || @opponent.points >= 3 && @points == (@opponents.points - 2)
        puts "You lose."
      end
    end 

    def advantage?
      @points >= 3 && @opponent.points == (@points - 1)
    end

    def duece?
      @points >= 3 && @opponent.points == @points
    end
  end
end