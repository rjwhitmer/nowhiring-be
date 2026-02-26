class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :email,           null: false, index: { unique: true }
      t.boolean :is_company, null: false, default: false

      t.boolean :verified, null: false, default: false

      t.timestamps
    end
  end
end
