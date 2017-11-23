class CreateBmis < ActiveRecord::Migration[5.1]
  def change
    create_table :bmis do |t|
      t.string :category
      t.integer :from
      t.integer :to

      t.timestamps
    end
  end
end
