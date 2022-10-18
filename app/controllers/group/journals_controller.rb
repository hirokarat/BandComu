class Group::JournalsController < ApplicationController
  
  def new
    @journal=Journal.new
  end
  
  def create
    @journal=Journal.new(journal_params)
    if @journal.save
      flash[:notice] = "投稿を作成しました"
      redirect_to index
    else
      render new
    end
  end
  
  def index
    @journals=Journal.all
  end
  
  def destroy
    
  end
  
  private
  def journal_params
    params.require(:journal).permit(:journal, :activity_image)  
  end
  
  
end
