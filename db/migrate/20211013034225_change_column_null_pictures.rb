class ChangeColumnNullPictures < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pictures, :content, false
  end
end
