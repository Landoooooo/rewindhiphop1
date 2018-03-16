class AddEmbedToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :embed, :string
  end
end
