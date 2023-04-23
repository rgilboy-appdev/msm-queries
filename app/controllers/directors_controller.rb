class DirectorsController < ApplicationController

def index

  @list_of_directors = Director.all


  render({:template => "director_templates/index.html.erb"})

end

def wisest

  @list_of_directors = Director.all.where.not(:dob => 0)

  @old_to_young = @list_of_directors.order({:dob => :asc})

  @oldest = @old_to_young.first



  render({:template => "director_templates/eldest.html.erb"})
end

def youngest

  @list_of_directors = Director.order({:dob => :desc})

  @youngest = @list_of_directors.first

  render({:template => "director_templates/youngest.html.erb"})

end

def details
  @director_id = params.fetch("id").to_i

  @director = Director.where(:id => @director_id).first

  @filmography = Movie.where(:director_id => @director_id)


  render({:template => "director_templates/details.html.erb"})

end


  
end
