class PhotosTable < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :photo
      t.string :name
      t.belongs_to :user
  end
  end
end
