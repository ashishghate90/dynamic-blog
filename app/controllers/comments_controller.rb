class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace("comment_form", partial: "comments/form", locals: { post: @post, comment: Comment.new }),
            turbo_stream.remove("no_comments")
          ]
        end
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("comment_form", partial: "comments/form", locals: { post: @post, comment: @comment })
        end
        format.html { redirect_to @post, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("comment_wrapper_#{@comment.id}", partial: "comments/edit_form", locals: { post: @post, comment: @comment })
      end
      format.html
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("comment_wrapper_#{@comment.id}", partial: "comments/comment", locals: { comment: @comment })
        end
        format.html { redirect_to @post, notice: 'Comment was successfully updated.' }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("comment_wrapper_#{@comment.id}", partial: "comments/edit_form", locals: { post: @post, comment: @comment })
        end
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.turbo_stream { head :ok } # Let Action Cable handle the removal
      format.html { redirect_to @post, notice: 'Comment was successfully deleted.' }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def check_owner
    redirect_to @post, alert: 'Not authorized.' unless @comment.user == current_user
  end
end