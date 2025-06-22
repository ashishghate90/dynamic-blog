class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  scope :recent, -> { order(created_at: :desc) }

  after_create_commit :broadcast_new_comment
  after_update_commit :broadcast_updated_comment
  after_destroy_commit :broadcast_removed_comment

  private

  def broadcast_new_comment
    # Use the safe partial without Devise helpers
    broadcast_prepend_to(
      "comments_#{post.id}",
      target: "comments_list",
      partial: "comments/comment_broadcast",
      locals: { comment: self }
    )
  end

  def broadcast_updated_comment
    broadcast_replace_to(
      "comments_#{post.id}",
      target: "comment_#{id}",
      partial: "comments/comment_broadcast",
      locals: { comment: self }
    )
  end

  def broadcast_removed_comment
    broadcast_remove_to(
      "comments_#{post.id}",
      target: "comment_#{id}"
    )
  end
end