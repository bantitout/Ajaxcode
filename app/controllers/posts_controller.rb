

class PostsController < ApplicationController
 
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
      @posts = Post.all
    end
   
    def show
    end
   
    def new
      @post = Post.new
    end
   
    def create
      @post = Post.create(post_params)
   
      respond_to do |format|
        if @post.save
          format.json { head :no_content }
          format.js
        else
          format.json { render json: @post.errors.full_messages, 
                              status: :unprocessable_entity }
        end
        
      end
    end
   
    def edit
    end
   
    def update
       respond_to do |format|
        if @post.update(post_params)
          format.json { head :no_content }
          format.js
        else
          format.json { render json: @post.errors.full_messages,
                                     status: :unprocessable_entity }
        end
       
      end
    end
   
   
    def destroy
   
      @post.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to posts_url }
        format.json { head :no_content }
      end
    end
   
  private
    
    def set_post
        @post = Post.find(params[:id])
    end
    
    def post_params
      params.require(:post).permit(:titel, :body)
    end
   
  end
  