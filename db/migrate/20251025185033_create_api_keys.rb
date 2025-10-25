class CreateApiKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :api_keys do |t|
      t.string :identity
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
