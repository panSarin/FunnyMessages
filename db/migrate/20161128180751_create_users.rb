class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :dialect
      t.string :persistence_token

      t.timestamps
    end
  end
end
