require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
    @count_card = 0
  end

  def count
    @cards.count
  end

end
