class AddFinishedOnToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :finished_on, :string
    add_column :books, :date, :string
  end
end
