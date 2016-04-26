class CreateContacs < ActiveRecord::Migration
  def change
    create_table :contacs do |t|
      t.string :name
      t.string :email
      t.text :comments
      
      t.timestamps 
    end
  end
end
