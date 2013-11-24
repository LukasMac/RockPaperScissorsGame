class GameServer
  ROCK, PAPER, SCISSORS = 'rock', 'paper', 'scissors'
  
  def initialize(player_a, player_b)
    @player_a, @player_b = player_a, player_b
  end
  
  def play
    winner = calculate_score(@player_a.play, @player_b.play)
    score(winner)
  
    "#{winner.upcase}: PlayerA score #{@player_a.score}, PlayerB score #{@player_b.score}."
  end
  
  def score(game_result)
    if game_result == :draw
      @player_a.add_score(1)
      @player_b.add_score(1)
    elsif game_result == :a_wins
      @player_a.add_score(3)
    elsif game_result == :b_wins
      @player_b.add_score(3)
    end
  end
  
  def calculate_score(option_a, option_b)
    return :draw if option_a == option_b
    
    who_beats_who = { ROCK => SCISSORS, PAPER => ROCK, SCISSORS => PAPER }
    
    if who_beats_who[option_a] == option_b
      :a_wins
    else
      :b_wins
    end
  end
end