class People::JournalsController < ApplicationController

  def index
    @journals = Journal.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def show
    @journal = Journal.find(params[:id])
    @journal_comment=JournalComment.new
    @journal_tags = @journal.tags
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
　　　　　　　#検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
　　　　　　　　#検索されたタグに紐づく投稿を表示
    @journals=@tag.journals.page(params[:page]).per(10)
  end


end
