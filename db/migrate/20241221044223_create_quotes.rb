class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :qu_text, null: false
      t.integer :pub_year, null: true
      t.text :comment, null: true
      t.boolean :is_public, default: true
      t.references :user, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
