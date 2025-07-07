class RenameAccStringToAccStatus < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :acc_string, :acc_status
  end
end
