class CreateBodyMasses < ActiveRecord::Migration[5.1]
  def change
    create_table :body_masses do |t|
      t.decimal :weight
      t.decimal :height
      t.string :bmi
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
