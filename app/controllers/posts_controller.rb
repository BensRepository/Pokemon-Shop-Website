class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! # users must be logged in to access any post page
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    if params[:search] #filters post by search term inputted by user
      @search_term = params[:search]
      @posts = @posts.search_by(@search_term)
    end
  end

  def display_user_posts
    @posts = Post.user_posts(current_user)
    if params[:search]#filters post by search term inputted by user
      @search_term = params[:search]
      @posts = @posts.search_by(@search_term).user_posts(current_user)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    if @post.user != current_user #validating so only posts owner can edit it
      redirect_to posts_url, notice: t('.notice')
    else
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user #when post is created a user is assigned to its user field
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: t('.notice') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :author, :date)
    end
end
