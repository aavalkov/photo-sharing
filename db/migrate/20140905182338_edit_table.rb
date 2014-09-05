class EditTable < ActiveRecord::Migration
  def change
    rename_table :tags_photos, :photos_tags
  end
end
