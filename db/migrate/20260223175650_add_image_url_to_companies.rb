class AddImageUrlToCompanies < ActiveRecord::Migration[8.1]
  def change
    add_column :companies, :image_url, :string
  end
end
