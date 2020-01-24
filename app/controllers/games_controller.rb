require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    def generate_grid(grid_size)
      keys = ""
      grid_size.times { keys += ('a'..'z').to_a.sample.to_s }
      @letters = keys.split(//)
    end
    generate_grid(rand(4..12))
  end

  def score
  # raise
   @list = params[:letter_list].gsub(/\s+/, '')
   @arr = @list.split("")

    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)

    arr = params[:answer].split(//)
    word = params[:answer]
    arr.each do |x|
      if @arr.include?(x)
        @arr.delete_at(@arr.index(x) || @arr.length)
          if user['found'] == true
            @alert = "Congratulations! #{word.upcase} is a valid english word!"
            @score = "Your Score : #{params[:answer].length}"
          else
            @alert = 'Sorry but ' + word.upcase + ' does not seem to be a valid english word.'
          end
      else
        @alert = "Sorry but " + word.upcase + " can't be build of " + @arr
      end
      @lett = "Letters left : #{@arr.join(",")}"
    end
    # binding.pry
  end
end
