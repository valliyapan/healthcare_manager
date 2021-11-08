class CreateClerks < ActiveRecord::Migration[6.1]
  def change
    create_table :clerks do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :hospital, foreign_key: true
      t.timestamps
    end
  end
end
