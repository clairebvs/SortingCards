 # require "./lib/card"
 # require './lib/guess'

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
    @index_start += 1
  end

  def number_correct
    @correct_guess += 1
    if @guesses.last.correct?
         @correct_guess
    end
      @correct_guess
  end

  def percent_correct
    (@correct_guess / @guesses.count ) * 100.00
    binding.pry
    # y = x * 100

  end
  #   @guesses.select do |guess|
  #     if guess.correct?
  #       @correct_guess += 1
  #     end
  #   end
  #   @correct_guess
  # end
end
