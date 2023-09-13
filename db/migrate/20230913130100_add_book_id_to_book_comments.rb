class AddBookIdToBookComments < ActiveRecord::Migration[6.1]
  def change
    add_column :book_comments, :book_id, :integer
  end
end
