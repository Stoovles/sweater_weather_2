class AddForeignKeyToFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_reference :favorites, :user
    remove_reference :favorites, :city
  end
end
