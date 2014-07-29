class CommentsController < ApplicationController
def index
  @multi = find_multi
  @comments = @multi.comments
end

def create
  @multi = find_multi
  @comment = @multi.comments.build(params[:comment])
  if @comment.save
    flash[:notice] = "Successfully created comment."
    redirect_to :id => nil
  else
    render :action => 'new'
  end
end

private

def find_multi
  params.each do |name, value|
    if name =~ /(.+)_id$/
      return $1.classify.constantize.find(value)
    end
  end
  nil
end