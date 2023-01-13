class Admin::TeamsController < ApplicationController
  before_action :user_shut_out
  before_action :authenticate_admin!
  
  def index
    @teams=Team.all.page(params[:page]).per(10)
    if params[:area].present?
      @teams = @teams.get_by_area params[:area]
    elsif params[:genre].present?
      @teams = @teams.get_by_genre params[:genre]
    elsif params[:area].present? && params[:genre].present?
      @teams=@teams.get_by_area params[:area]
      @teams=@teams.get_by_genre params[:genre]
    end
  end
  
  def show
    @team=Team.find(params[:id])
  end
  
  def destroy
    @team = Team.find(params[:id]) 
    @team.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to action: :index
  end
end
