require './lib/card'

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def sort
    while @cards == @cards.empty?
      x = @cards.max_by do |card|
        binding.pry
        card.value
        end
    array_sort = Array.new
    @cards.delete(x)
    array_sort.push(x)
      y = @cards.max_by do |card|
        card.value
        end
      y
    @cards.delete(y)
    array_sort.unshift(y)
      z = @cards.max_by do |card|
        card.value
        end
      z
    @cards.delete(z)
    array_sort.unshift(z)
  end
  array_sort
  end

end
