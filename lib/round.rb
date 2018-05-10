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

  def percent_correct
    ((@number_correct.to_f / @guesses.length.to_f ) * 100)
  end

end
