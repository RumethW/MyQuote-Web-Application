class ChangeDefaultAccStatusInUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :acc_status, 'Active'
  end
end
