class GamesController < ApplicationController
  def new
    @letters = []
    10.times {@letters << ('A'..'Z').to_a.sample}
    @letters
  end

  def score
    @grid = params[:grid].chars
    grid2 = @grid
    # raise
    @question = params[:question].upcase.chars

    lost = false
    # Par défaut c'est bon
    @question.each do |letter|
      index_found = grid2.find_index(letter)
      if index_found
        grid2.delete_at(index_found)
      else
        lost = true
        break
      end
    end

    # 1. check that letters of word is in the grid
    if lost = false
      "Congratulations!"
    else
      "Sorry, but ERRT can't be built out of #{@grid}"
    end
    # byebug

    # 2. check the word exist for real (thanks to API: open(url).read) => JSON.parse
    # def english_word?(word)
    #   response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    #   json = JSON.parse(response.read)
    #   return json['found']
    # end
    # 3. compute score
  end

end
