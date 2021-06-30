class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
    render json: @posts, methods: [:image_url]
  end  

  def create
    post = Post.new(post_params)

    if post.save
      render json: post, methods: [:image_url]
    else   
      render json: post.errors, status: 422
    end  
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy!
    render json: post
  end
  
  private

  def post_params
    params.permit(:title, :image)
  end  
end
