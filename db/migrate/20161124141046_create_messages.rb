class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.string :username
      t.string :dialect
      t.text :content_with_dialect

      t.timestamps
    end
  end
end
