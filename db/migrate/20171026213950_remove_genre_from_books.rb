class RemoveGenreFromBooks < ActiveRecord::Migration[5.0]
  def change
    remove_index :books, [:genre_id]
    remove_column :books, :genre_id
  end
end
