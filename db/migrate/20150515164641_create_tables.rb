class CreateTables < ActiveRecord::Migration
  def change
    create_table :bands do |t|
        t.string :name
        t.timestamps null: false
      end
      create_table :venues do |t|
        t.string :name
        t.timestamps null: false
      end
      create_table :bands_venues, id: false do |t|
        t.belongs_to :band, index: true
        t.belongs_to :venue, index: true
      end
  end
end
