class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /comments
  # GET /comments.json
  def index
    if (params[:post_id])
      @post = Post.find(params[:post_id])
      @comments = @post.comments
    else
      @comments = Comment.all
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    authorize User
  end

  # GET /comments/new
  def new
    @comment = current_user.comments.build
    @post = Post.find(params[:post_id])
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    @comment.username = current_user.name
    respond_to do |format|
      if @comment.save
        current_user.likes = current_user.likes + 1
        current_user.update_attributes(:likes => current_user.likes)
        if current_user.likes >= 100
          if current_user.role.eql?"user"
            current_user.update_attributes(:role => 1)
          end
        end
        format.html { redirect_to post_comments_path }
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
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
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
      current_user.likes = current_user.likes - 1
      current_user.update_attributes(:likes => current_user.likes)
      if current_user.likes < 100
        if current_user.role.eql?"lead"
          current_user.update_attributes(:role => 2)
        end
      end
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:username, :content, :likes)
    end
end
