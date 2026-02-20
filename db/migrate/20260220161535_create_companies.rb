class CreateCompanies < ActiveRecord::Migration[8.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :professional_sector
      t.string :size
      t.string :company_url
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.date :date_founded
      t.string :company_contact_url

      t.timestamps
    end
  end
end
