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
    @index_start += 1
  end

  def number_correct
   @correct_guess += 1
    if guesses.last.correct?
      # @correct_guess +=1
      # binding.pry
    end
     @correct_guess
  end
  #   @guesses.select do |guess|
  #     if guess.correct?
  #       @correct_guess += 1
  #     end
  #   end
  #   @correct_guess
  # end

end

# def first
#   @guesses.first
# why I do not need a method first
# end
