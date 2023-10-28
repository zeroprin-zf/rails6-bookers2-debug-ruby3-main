class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range] #検索フォームから情報を受け取る

    if @range == "User" #if文でUserかBookか
      @users == User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
end
#looksメソッドで検索内容を取得。変数に代入
