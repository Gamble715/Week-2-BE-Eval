require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to be(game.player2)
      expect(game.player2.opponent).to be(game.player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(1)

      expect(game.player1.points).to eq(1)
    end
  end
end

describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!

      expect(player.points).to eq(1)
    end
  end

  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end
    
    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1

        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do  
        player.points = 2

        expect(player.score).to eq('thirty')
      end 
    end
    
    context 'when points is 3' do
      it 'returns forty' do  
        player.points = 3

        expect(player.score).to eq('forty')
      end
    end

    context 'when both players points are equal from three points and greater' do
      it 'returns duece' do
         player.points = 3
         player.opponent.points = 3

        expect(player.score).to eq('duece')
      end
    end

    context 'when the players points are one more than the opponents and from three points and greater' do
      it 'returns advantage' do
         player.points = 4
         player.opponent.points = 3

        expect(player.score).to eq('advantage')
      end
    end
  end

  describe '#wins_game' do
    it 'returns message of outcome' do
      player.points = 4
      player.opponent.points = 2

      expect(player.wins_game).to eq("You win.")
    end
  end
end