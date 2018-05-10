require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess'
require './lib/card'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_round_has_deck
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_start_with_an_empty_array_of_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_round_has_a_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    guess = Guess.new("3 of Hearts", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_round_can_record_guess_and_count
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    guess = Guess.new("3 of Hearts", card_1)
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    guess1 = round.record_guess('3 of Hearts')
    assert_equal '3 of Hearts', round.guesses[0].response

    assert_equal 1, round.guesses.count
    refute round.guesses.empty?
  end

  def test_first_guesses_has_feedback
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.record_guess("3 of Hearts")
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_round_can_count_correct_guesses
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.record_guess("3 of Hearts")
    assert_equal 1, round.number_correct
  end

  def test_round_has_next_current_card
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.record_guess('3 of Hearts')
    assert_equal card_2, round.current_card
  end

  def test_record_next_guess_and_count_increase
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    guess1 = round.record_guess('3 of Hearts')
    guess2 = round.record_guess('Jack of Diamonds')

    assert_equal 'Jack of Diamonds', round.guesses[1].response
    assert_equal 2, round.guesses.count
  end

  def test_feedback_for_second_round
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.record_guess('3 of Hearts')
    round.record_guess("Jack of Diamonds")

    assert_equal "Incorrect.", round.guesses.last.feedback
  end

  def test_number_correct_is_still_1
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.record_guess('3 of Hearts')
    round.record_guess("Jack of Diamonds")

    assert_equal 1, round.number_correct
  end

  def test_can_count_percent_of_correct_response
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)

    round.record_guess('3 of Hearts')
    round.record_guess("Jack of Diamonds")

    assert_equal 50, round.percent_correct
  end

end
