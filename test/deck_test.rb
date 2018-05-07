require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/guess'
require './lib/card'
require './lib/deck'

class DeckTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])

    assert_instance_of Deck, deck
  end

  def test_deck_has_cards
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end 
end

# card_1 = Card.new("3","Hearts")
# card_2 = Card.new("4", "Clubs")
# card_3 = Card.new("5", "Diamonds")
# deck = Deck.new([card_1, card_2, card_3])
# deck.cards
# => [card_1, card_2, card_3]
# deck.count
# => 3
