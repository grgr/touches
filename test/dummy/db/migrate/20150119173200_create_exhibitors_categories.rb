class CreateExhibitorsCategories < ActiveRecord::Migration
  def change
    create_table :exhibitors_categories do |t|
      t.integer :exhibitor_id
      t.integer :category_id

      t.timestamps
    end
  end
end
