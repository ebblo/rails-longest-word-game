require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    letters = []
    10.times do
      letters << ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "Y", "Z"].sample
    end
    @letters = letters
  end

  def score
    @score = params[:tenLetters]
  end

  def check()
  if @score.length <= @letters.length
    if @score.each { |letter| @score.include?(letter) }
      if english?(@score) == true
        'well done'
      else
        'not an english word'
      end
    else
      'not in the grid'
    end
  else
    'too much letter'
  end
end

def english?(word)
  response = open("https://wagon-dictionary.herokuapp.com/#{word}")
  json = JSON.parse(response.read)
  return true if json['found'] == true

  false
end

#<%= link_to "Play again", new %>
end

# 1. verifier si le nombre de lettre est bien inférieur ou égal au grid
# 2. verfier si les lettres choisies apparaissent bien dans l'array
# 3. verifier via l'API si le mot existe


