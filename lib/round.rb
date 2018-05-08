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


end
