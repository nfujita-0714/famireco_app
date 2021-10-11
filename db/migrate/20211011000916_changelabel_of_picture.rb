class ChangelabelOfPicture < ActiveRecord::Migration[5.2]
  def change
    add_reference :labelings, :picture, foreign_key: true
  end
end
