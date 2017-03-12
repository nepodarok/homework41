class AddAttachmentImageToUsers < ActiveRecord::Migration
  def up
    add_attachment :photos, :image
  end

  def down
    remove_attachment :users, :image
  end
end
