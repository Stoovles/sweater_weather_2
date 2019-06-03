class CreateCity < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :state
      t.decimal :lat
      t.decimal :lng
    end
  end
end
