class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author
      t.integer :quantity
      #t.belongs_to :user

      t.timestamps
    end
  end
end
