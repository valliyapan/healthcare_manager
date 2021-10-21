class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.boolean :is_blocked
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
