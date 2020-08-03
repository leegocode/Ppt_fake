class AddPermalinkToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :permalink, :string
  end
end
