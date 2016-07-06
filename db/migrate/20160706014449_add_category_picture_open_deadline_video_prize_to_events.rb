class AddCategoryPictureOpenDeadlineVideoPrizeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :category, :string
    add_column :events, :picture, :string
    add_column :events, :public, :boolean
    add_column :events, :deadline, :datetime
    add_column :events, :video, :string
    add_column :events, :prize, :string
  end
end
