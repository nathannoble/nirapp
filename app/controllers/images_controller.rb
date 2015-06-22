class ImagesController < ApplicationController
  
  def create
      @post = Post.find(params[:post_id])
      @comment = @post.images.create(image_params)
      
      redirect_to post_path(@post)
    end
    
    def destroy
      @post = Post.find(params[:post_id])
      @image = @post.images.find(params[:id])
      @image.destroy
      redirect_to post_path(@post)
    end
 
    private
      def image_params
        params.require(:image).permit(:image)
      end
      
end