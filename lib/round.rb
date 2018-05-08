 require "./lib/card"

class Round
  attr_reader :deck,
              :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
    @index_start = 0
  end

  def current_card
    @deck.cards[@index_start]
  end

  def record_guess(response)
    question = Guess.new(response, current_card)
    @guesses << question
  end


end
