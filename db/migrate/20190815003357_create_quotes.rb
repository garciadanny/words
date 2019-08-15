class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.text :text
      t.string :source, limit: 510
      t.string :author

      t.timestamps
    end
  end
end
