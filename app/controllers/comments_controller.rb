class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(permit_comment)
    if @comment.save
      flash[:notice] = "Success!"
      redirect_to comment_path(@comment)
    else
      flash[:error] = @comment.errors.full_messages
      redirect_ro new_comment_path
    end
  end

  private
    def permit_comment
      params.require(:comment).permit(:description, :user_name, :where_we_went, :rating, :email)
    end

end
