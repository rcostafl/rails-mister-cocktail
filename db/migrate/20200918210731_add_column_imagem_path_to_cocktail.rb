class AddColumnImagemPathToCocktail < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :image_path, :string
  end
end
