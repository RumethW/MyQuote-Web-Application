class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :fname, null:false
      t.string :lname, null:false
      t.integer :birth_year, null:false
      t.integer :death_year, null:true
      t.text :source_biography, null:true

      t.timestamps
    end
  end
end
