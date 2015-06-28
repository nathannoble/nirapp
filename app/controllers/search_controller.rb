class SearchController < ApplicationController
  
  def search
    if params[:q].nil?
      @posts = []
    else
      @posts = Post.search params[:q], fields: [:title], highlight: true
    end
    
    respond_to do |format|
      format.js
    end
  end

end
