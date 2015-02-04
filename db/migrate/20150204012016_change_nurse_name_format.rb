class ChangeNurseNameFormat < ActiveRecord::Migration
  def up
    change_column :nurses, :nurse_name, :string
  end

  def down
    change_column :nurses, :nurse_name, :text
  end
end
