class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :job_title, :string
    add_column :users, :company, :string
    add_column :users, :host, :boolean, default: false
    add_column :users, :admin, :boolean, default: false
  end
end
