class GamesController < ApplicationController

  def new
    #  The new action will be used to display a new random grid and a form
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    # The form will be submitted (with POST) to the score action
    @word = params[:word].upcase
    @letters_string = params[:letters]

    @included = true
    @word.chars do |letter|
      @included = params[:letters].split.include?(letter)
    end

    @error_message = "Sorry, but #{@word} can't be build out of #{@letters_string}"

  end
end
