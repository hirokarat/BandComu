class Group::TeamsController < ApplicationController

  
  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = current_team
  end

  def update
    @team = current_team
    if @team.update(team_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to group_team_path(current_team)
    else
      render :edit
    end
  end


  private

  def team_params
    params.require(:team).permit(
      :name,
      :email,
      :area,
      :genre,
      :count,
      :profile_image,
      :age,
      :part,
      :condition,
      :cost,
      :practice_date,
      :practice_area,
      :location,
      :header_image)
  end


end
