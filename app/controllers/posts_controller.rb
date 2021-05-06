class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new create]

  def index
    @posts = Post.all
  end


  def show; end


  def new
    @post = current_user.posts.build
  end


  def edit; end


  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  def set_post
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :body)
  end
end
