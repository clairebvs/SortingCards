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
    array_sort = []
    until @cards.length == 0
     # loop do
    x = @cards.max_by do |card|
         card.value
        end
      x
    array_sort.unshift(x)
    @cards.delete(x)
    end


    #   y = @cards.max_by do |card|
    #     card.value
    #     end
    #   y
    # @cards.delete(y)
    # array_sort.unshift(y)
    #   z = @cards.max_by do |card|
    #     card.value
    #     end
    #   z
    # @cards.delete(z)
    # array_sort.unshift(z)
    array_sort
    # binding.pry
  end

  # def sort
  #   x = @cards.length
  #
  #   loop do
  #     swapped = false
  #
  #     (x-1).times do |i|
  #       if array[i] > array[i+1]
  #         array[i], array[i+1] = array[i+1], array[i]
  #         swapped = true
  #       end
  #     end
  #
  #     break if not swapped
  #   end
  #   x
  # end
    # binding.pry



end
