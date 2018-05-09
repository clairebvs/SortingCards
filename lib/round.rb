 require "./lib/card"
 require './lib/guess'

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @index_start = 0
    @correct_guess = 0
  end

  def current_card
    @deck.cards[@index_start]
  end

  def record_guess(response)
    question = Guess.new(response, current_card)
    @guesses << question
  end

  def first
    first_guess = @guesses[0]
  end

  def number_correct
    # response = Guess.new(response, current_card)
    # guess = Guess.new(response, current_card)
    # x = record_guess(response)
    # if x == guess.correct?
    #   @correct_guess += 1
    # end

    @guesses.select do |guess|
     if guess.correct?
       @correct_guess += 1
     end
    end
    @correct_guess
  end



end
