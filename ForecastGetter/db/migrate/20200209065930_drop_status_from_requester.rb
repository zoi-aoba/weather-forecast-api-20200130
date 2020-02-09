class DropStatusFromRequester < ActiveRecord::Migration[5.2]
  def change
    remove_column :requesters, :status, :string
  end
end
