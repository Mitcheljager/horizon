class AddDomainToApiKeys < ActiveRecord::Migration[8.0]
  def change
    add_column :api_keys, :domain, :string
  end
end
