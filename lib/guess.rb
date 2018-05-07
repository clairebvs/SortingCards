class Guess
  attr_reader :card,
              :response

  def initialize(response, card)
    @response = response
    @card = card
  end

  def correct?
    # REFACTOR!!!!
    # with other method in card to interpolate value and suit with of
    array_of_strings = @response.split
    array_of_strings[0] == @card.value && array_of_strings[2] == @card.suit
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
  end

end
