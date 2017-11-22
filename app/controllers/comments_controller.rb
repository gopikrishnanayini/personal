class CommentsController < ApplicationController
	before_filter :load_commentable
  def index
  	@comments = @commentable.comments
  end

  def new
  	@comment = @commentable.comments.new
  end

  def create
  	@comment = @commentable.comments.new(comment_params)
    if @comment.save
        redirect_to [@commentable, :comments], notice: "Comment created."
    else
    	render :new
    end
  end
end