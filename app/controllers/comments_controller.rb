class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :new]

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
      flash[:notice] = "Відгук успішно додано!"
      redirect_to comment_path(@comment)
    else
      flash[:error] = @comment.errors.full_messages
      redirect_ro new_comment_path
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment].permit(:description, :user_name, :where_we_went, :rating, :email))
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private
    def permit_comment
      params.require(:comment).permit(:description, :user_name, :where_we_went, :rating, :email)
    end

end
