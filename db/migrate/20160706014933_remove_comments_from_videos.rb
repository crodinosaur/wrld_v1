class RemoveCommentsFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos, :comments, :string
  end
end
