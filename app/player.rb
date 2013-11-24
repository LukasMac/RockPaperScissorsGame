require 'httparty'  

class Player
  def initialize(url)
    @url = url
    @score = 0
  end
  
  def play
    HTTParty.get(@url).parsed_response
  end
  
  def score
    @score
  end
  
  def add_score(score)
    @score += score
  end
end