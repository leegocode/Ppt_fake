class AddPermalinkToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :permalink, :string
  end
end
