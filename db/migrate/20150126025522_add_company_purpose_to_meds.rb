class AddCompanyPurposeToMeds < ActiveRecord::Migration
  def change
    add_column :medications, :company, :string
    add_column :medications, :adverse_effects, :string
  end
end
