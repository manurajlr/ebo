class CreateUsers < ActiveRecord::Migration
		def change
				create_table :users do |t|
					  t.belongs_to :designation, index:true
						t.string :first_name
						t.string :middle_name
						t.string :last_name
						t.string :email
						t.string :login
						t.string :password
						t.string :employee_id
						t.date :date_of_birth
						t.string :gender
						t.string :time_zone
						t.date :date_of_joining
						t.boolean :is_active
						t.boolean :is_locked
						t.string :education
						t.string :comments
						t.date :date_of_deactivation
						t.string :reason_for_deactivation
						t.string :work_phone
						t.timestamps null: false
				end
		end
end
