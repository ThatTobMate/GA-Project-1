class CommentsController < ApplicationController

  
  def index
    @multi = find_multi
    @comments = @multi.comments

  end
  

  def new
    @multi = find_multi
  end

  def create
    @multi = find_multi
    @comment = @multi.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @multi
    else
      render :action => 'new'
    end
  end

  def destroy
    @multi = find_multi
    @multi.comments.find(params[:id]).destroy
    redirect_to @multi
  end

end