 # require "./lib/card"
 # require './lib/guess'

class Round
  attr_reader :deck,
              :guesses,
              :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @index_start = 0
    @number_correct = 0
  end

  def current_card
    @deck.cards[@index_start]
  end

  def record_guess(response)
    question = Guess.new(response, current_card)
    @guesses << question
    if question.correct?
      @number_correct += 1
    end
    @index_start += 1
  end

  # def number_correct
  #   @correct_guess
  #   # += 1
  #   # if @guesses.last.correct?
  #   #       @correct_guess += 1
  #   # end
  #     # @correct_guess
  # end

  def percent_correct
    ((@number_correct.to_f / @guesses.length.to_f ) * 100)
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
