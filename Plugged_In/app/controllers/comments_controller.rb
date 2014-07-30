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
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to @multi
    else
      render :action => 'new'
    end
  end

end