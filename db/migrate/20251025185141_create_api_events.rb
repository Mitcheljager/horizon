class CreateApiEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :api_events do |t|
      t.string :name
      t.json :properties
      t.references :api_key, null: false, foreign_key: true

      t.timestamps
    end
  end
end
