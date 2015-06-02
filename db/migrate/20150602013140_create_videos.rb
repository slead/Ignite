class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url

      t.references :event, index: true

      t.timestamps
    end
  end
end
