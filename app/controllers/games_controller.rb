require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @alphabet = ('a'..'z').to_a
    @letters = []
    10.times { @letters.push(@alphabet.sample) }
  end
def score
    @check_letters = params[:letters].downcase
    @word = params[:word]
    @word_letters = @word.split('')
    @check_match = @word_letters.all? { |letter| @check_letters.include?(letter) }
    url = 'https://wagon-dictionary.herokuapp.com/' + @word
    check_serialized = open(url).read
    @check_eng_word = JSON.parse(check_serialized)["found"]
    # raise
  end
end
