class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort
    array_sort = []
    until @cards.length == 0
      x = @cards.max_by do |card|
        card.value
      end
      x
      array_sort.unshift(x)
      @cards.delete(x)
    end
    array_sort
  end

  def merge_sort
    sort
  end
end
