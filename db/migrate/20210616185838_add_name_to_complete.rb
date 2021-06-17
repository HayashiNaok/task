class AddNameToComplete < ActiveRecord::Migration[6.1]
  def change
    add_column :completes, :name, :string
  end
end
