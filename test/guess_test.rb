require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/guess'
require './lib/card'

class GuessTest < Minitest::Test

  def test_it_exists
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Guess, guess
  end

  def test_guess_on_card
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_instance_of Card, guess.card
  end

  def test_guess_on_different_card
    card2 = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card2)

    assert_instance_of Card, guess.card
    # is an instance of the class Card enough or should it be equal to an actual card suit and value so that the test would be stronger as refactor

    should say assert_equal card, guess.card
  end

  def test_guess_has_response
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert_equal "10 of Hearts", guess.response
  end

  def test_guess_has_different_response_on_different_card
    card2 = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card2)

    assert_equal "2 of Diamonds", guess.response
  end

  def test_guess_is_correct?
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)

    assert guess.correct?
  end

  def test_guess_is_not_always_correct
    card2 = Card.new("Queen", "Clubs")
    guess = Guess.new("2 of Diamonds", card2)

    refute guess.correct?
  end

  def test_guess_gets_different_feedback
    card = Card.new("10", "Hearts")
    guess = Guess.new("10 of Hearts", card)
    card2 = Card.new("Queen", "Clubs")
    guess2 = Guess.new("2 of Diamonds", card2)

    assert_equal "Correct!", guess.feedback
    assert_equal "Incorrect.", guess2.feedback
  end

end
