class ActorsController < ApplicationController

  def index
    
    @actors_list = Actor.all


    render({:template => "/actor_templates/index.html.erb"})
  end

  def details

    @actor_id = params.fetch("id").to_i

    @actor = Actor.where(:id => @actor_id).first

    @characters = Character.where(:actor_id => @actor_id)

    render({:template => "/actor_templates/details.html.erb"})
  end

end
