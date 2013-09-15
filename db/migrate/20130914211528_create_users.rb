class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :password_digest
      t.string :name
      t.string :email
      t.string :gender
      t.string :dob
      t.string :zip

      t.timestamps
    end
  end
end
