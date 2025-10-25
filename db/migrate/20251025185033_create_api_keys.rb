class CreateApiKeys < ActiveRecord::Migration[8.0]
  def change
    create_table :api_keys do |t|
      t.string :identity
      t.integer :project_id

      t.timestamps
    end
  end
end
