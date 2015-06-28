class SearchController < ApplicationController
  
  def search
    if params[:q].nil?
      @posts = []
    else
      
      if params[:q].empty?
        @posts = Post.search "*", page: params[:page], per_page: Rails.application.config.page_size
      else
        @posts = Post.search params[:q], fields: ["title^10", :text], highlight: true, operator: "or", page: params[:page], per_page: Rails.application.config.page_size
      end
      
    end
    
    respond_to do |format|
      format.js
      format.html { render :partial => 'posts/post_grid' }
    end
  end

end
