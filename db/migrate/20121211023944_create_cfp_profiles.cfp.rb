# This migration comes from cfp (originally 20121121020200)
class CreateCfpProfiles < ActiveRecord::Migration
  def change
    create_table :cfp_profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :title
      t.string :company
      t.text :bio
      t.string :locale

      t.timestamps
    end
  end
end
