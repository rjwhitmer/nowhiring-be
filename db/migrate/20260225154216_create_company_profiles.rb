class CreateCompanyProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :company_profiles do |t|
      t.string :company_name
      t.text :description
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :phone_number
      t.string :website_url
      t.string :linkedin_url
      t.string :twitter_url
      t.string :facebook_url
      t.string :industry
      t.string :company_size
      t.boolean :is_hiring, default: false

      t.timestamps
    end
  end
end
