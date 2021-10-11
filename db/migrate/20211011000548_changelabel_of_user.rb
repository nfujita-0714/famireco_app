class ChangelabelOfUser < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :labelings, :users
    remove_reference :labelings, :user, index: true
  end
end
