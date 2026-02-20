class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :title
      t.date :expected_start_date
      t.integer :starting_base_salary_range, null: true
      t.integer :ending_base_salary_range, null: true
      t.integer :hourly_wage, null: true
      t.boolean :is_hourly_wage
      t.boolean :is_active

      t.timestamps
    end
  end
end
