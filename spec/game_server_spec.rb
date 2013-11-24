require 'spec_helper'

describe GameServer do   
  ROCK, SCISSORS, PAPER = 'rock', 'scissors', 'paper'
  
  let(:null_player) { double('player').as_null_object }
  
  it "should respond to 'play'" do
    game_server = GameServer.new(null_player, null_player)
    
    game_server.should respond_to :play
  end
  
  it "should ask first player to play when game is played" do
    player_a = double('Player').as_null_object
    player_a.should_receive(:play).with(no_args())
              
    game_server = GameServer.new(player_a, null_player)
    game_server.play   
  end
  
  it "should ask second player to play when game is played" do
    player_b = double('Player').as_null_object
    player_b.should_receive(:play).with(no_args())
    
    game_server = GameServer.new(null_player, player_b)
    game_server.play   
  end
  
  def players_play(player_a_plays, player_b_plays)
    @player_a = double('player').as_null_object
    @player_a.stub(:play) { player_a_plays }
    
    @player_b = double('player').as_null_object
    @player_b.stub(:play) { player_b_plays }
  end
  
  context 'PlayerA plays: rock. PlayerB plays: rock.' do
    
    before(:each) do
      players_play(ROCK, ROCK)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should add 1 point to player A' do
      @player_a.should_receive(:add_score).with(1)
    end
    
    it 'should add 1 point to player B' do
      @player_a.should_receive(:add_score).with(1)
    end
  end
  
  context 'PlayerA plays: scissors. PlayerB plays: scissors.' do
    
    before(:each) do
      players_play(SCISSORS, SCISSORS)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should add 1 point to player A' do
      @player_a.should_receive(:add_score).with(1)
    end
    
    it 'should add 1 point to player B' do
      @player_a.should_receive(:add_score).with(1)
    end
  end
  
  context 'PlayerA plays: paper. PlayerB plays: paper.' do
    
    before(:each) do
      players_play(PAPER, PAPER)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should add 1 point to player A' do
      @player_a.should_receive(:add_score).with(1)
    end
    
    it 'should add 1 point to player B' do
      @player_a.should_receive(:add_score).with(1)
    end
  end
  
  context 'PlayerA plays: rock. PlayerB plays: scissors' do
  
    before(:each) do
      players_play(ROCK, SCISSORS)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should add 3 points to player A' do
      @player_a.should_receive(:add_score).with(3)
    end
  
    it 'should give no scores to player B' do
      @player_b.should_not_receive(:add_score)
    end
  end
  
  
  context 'PlayerA plays: rock. PlayerB plays: paper' do
  
    before(:each) do
      players_play(ROCK, PAPER)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should give no scores to player A' do
      @player_a.should_not_receive(:add_score)
    end
  
    it 'should add 3 point to player B' do
      @player_b.should_receive(:add_score).with(3)
    end
  end
  
  context 'PlayerA plays: paper. PlayerB plays: rock' do
  
    before(:each) do
      players_play(PAPER, ROCK)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should add 3 point to player A' do
      @player_a.should_receive(:add_score).with(3)
    end
        
    it 'should give no scores to player B' do
      @player_b.should_not_receive(:add_score)
    end
  end
  
  context 'PlayerA plays: paper. PlayerB plays: scissors' do
  
    before(:each) do
      players_play(PAPER, SCISSORS)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should give no scores to player A' do
      @player_a.should_not_receive(:add_score)
    end
    
    it 'should add 3 point to player B' do
      @player_b.should_receive(:add_score).with(3)
    end
  end
  
  context 'PlayerA plays: scissors. PlayerB plays: rock' do
  
    before(:each) do
      players_play(SCISSORS, ROCK)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should give no scores to player A' do
      @player_a.should_not_receive(:add_score)
    end
    
    it 'should add 3 point to player B' do
      @player_b.should_receive(:add_score).with(3)
    end
  end
  
  context 'PlayerA plays: scissors. PlayerB plays: paper' do
  
    before(:each) do
      players_play(SCISSORS, PAPER)
    end
    
    after(:each) do
      GameServer.new(@player_a, @player_b).play
    end
  
    it 'should add 3 point to player A' do
      @player_a.should_receive(:add_score).with(3)
    end
    
    it 'should give no scores to player B' do
      @player_b.should_not_receive(:add_score)
    end
  end
  
  it 'should return DRAW game string with players score after game play' do
    players_play(ROCK, ROCK)
    @player_a.stub(:score) { 1 }
    @player_b.stub(:score) { 1 }
    
    GameServer.new(@player_a, @player_b).play.should == 'DRAW: PlayerA score 1, PlayerB score 1.'
  end
  
  it 'should return A_WINS game string with players score after game play' do
    players_play(ROCK, SCISSORS)
    @player_a.stub(:score) { 3 }
    @player_b.stub(:score) { 0 }
    
    GameServer.new(@player_a, @player_b).play.should == 'A_WINS: PlayerA score 3, PlayerB score 0.'
  end
  
  it 'should return B_WINS game string with players score after game play' do
    players_play(ROCK, PAPER)
    @player_a.stub(:score) { 0 }
    @player_b.stub(:score) { 3 }
    
    GameServer.new(@player_a, @player_b).play.should == 'B_WINS: PlayerA score 0, PlayerB score 3.'
  end
end