class CreateExhibitors < ActiveRecord::Migration
  def change
    create_table :exhibitors do |t|
      t.string :name
      t.string :desc

      t.timestamps
    end
  end
end
