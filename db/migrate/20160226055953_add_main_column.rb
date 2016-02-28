class AddMainColumn < ActiveRecord::Migration
  def change
    add_column :posts, :main_page, :boolean, :default => false
  end
end
