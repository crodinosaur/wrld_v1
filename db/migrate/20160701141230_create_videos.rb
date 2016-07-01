class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.string :video_url
      t.references :entry, index: true

      t.timestamps
    end
  end
end
