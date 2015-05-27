class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :title
      t.integer :edition
      t.date :issue
      t.string :language
    end
  end
end
