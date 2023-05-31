class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :author, index: true, foreign_key: {to_table: :users, primary_key: :id}
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
