class Group::TeamsController < ApplicationController
  
  def index
    @teams=Team.all
  end
  
end
