class CreateUserProfiles < ActiveRecord::Migration[8.1]
  def change
    create_table :user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :mobile_phone_number
      t.string :home_phone_number
      t.string :linkedin_url
      t.string :github_url
      t.string :portfolio_url
      t.boolean :is_open_to_relocation, default: false
      t.boolean :is_open_to_remote, default: false
      t.boolean :is_over_18, default: false
      t.boolean :is_looking_for_job, default: true
      t.string :current_job_title
      t.string :current_company
      t.string :current_industry
      t.timestamps
    end
  end
end
