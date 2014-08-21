class CreatePostTagLinks < ActiveRecord::Migration
  def change
    create_table :post_tag_links do |t|
      t.references :post
      t.references :tag
      t.timestamps
    end
  end
end
