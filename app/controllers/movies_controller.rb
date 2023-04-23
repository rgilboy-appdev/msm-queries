class MoviesController < ApplicationController

  def index

    @movie_list = Movie.all


    render({:template => "movie_templates/index.html.erb"})
  end

  def details

    movie_id = params.fetch("id").to_i

    @movie = Movie.where(:id => movie_id).first

    render({:template => "movie_templates/details.html.erb"})

  end

  
end
