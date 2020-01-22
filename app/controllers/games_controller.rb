class GamesController < ApplicationController
  def new
  def generate_grid(grid_size)
    key = ""
    grid_size = rand(1..10)
    grid_size.times { key += ('a'..'z').to_a.sample.to_s }
    @grid = key

  # TODO: generate random grid of letters
end
  end

  def score
  end
end
