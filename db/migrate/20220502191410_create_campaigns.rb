class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :banners, default: "[]"
      t.text :activityChart, default: "[]"
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
