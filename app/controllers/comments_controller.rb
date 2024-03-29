class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action:set_post, only: [:new, :create]
  before_action :authenticate_user! #user must be logged in to access page
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

  end

  def display_user_comments
    @comments = current_user.comments

  end
  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.new
  end

  # GET /comments/1/edit
  def edit #validation so only the comments creator can edit it
    if @comment.user != current_user
      redirect_to posts_url, notice: t('.notice')
    else
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user #when comment is created a user is assigned to its user field

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: t('.notice') }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: t('.notice') }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.post, notice: t('.notice') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:post_id, :message)
    end

    def set_post
      @post = Post.find_by(id: params[:post_id]) ||  Post.find(comment_params[:post_id])
    end
end
