class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end

     create_table :tags_photos do |t|
      t.integer :tag_id
      t.integer :photo_id
    end
  end
end
