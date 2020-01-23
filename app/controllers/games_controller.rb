require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    def generate_grid(grid_size)
      keys = ""
      grid_size.times { keys += ('a'..'z').to_a.sample.to_s }
      @letters = keys.split(//)
      $passing = keys.split(//)
      $old = keys.split(//)
    end
    generate_grid(rand(4..12))
  end

  def score
    #raise

    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)

    arr = params[:answer].split(//)
    arr.each do |x|
      if $passing.include?(x)
        $passing.delete_at($passing.index(x) || $passing.length)
          if user['found'] == true
            @alert = "Congratulations! #{params[:answer].upcase} is a valid english word!"
            @score = "Your Score : #{params[:answer].length}"
          else
            @alert = 'Sorry but ' + params[:answer].upcase + ' does not seem to be a valid english word.'
          end
      else
        @alert = "Sorry but " + params[:answer].upcase + " can't be build of " + $old.join(",")
      end
      @lett = "Letters left : #{$passing.join(",")}"
    end
    # binding.pry
  end
end
