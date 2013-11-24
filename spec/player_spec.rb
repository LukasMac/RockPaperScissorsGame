require 'spec_helper'

describe Player do
  VALID_OPTIONS = ['rock', 'paper', 'scissors']
  PLAYER_API_URL = 'http://127.0.0.1:1337/playerA_plays'
  
  let (:player) { Player.new(PLAYER_API_URL) }
  
  it "should respond do 'plays'" do 
    player.should respond_to :play
  end

  it 'should return: rock, paper or scissors when plays' do
     VALID_OPTIONS.should include player.play
  end
  
  it 'should return 0 as initial total score' do
    player.score.should == 0
  end
  
  it 'should add score to total player score' do
    player.add_score(1)
    player.score.should == 1
  end
  
  it 'should sum all added scores to total player score' do
    player.add_score(1)
    player.add_score(1)
    player.score.should == 2
  end
end