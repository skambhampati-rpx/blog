class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :gender
      t.string :mobile_no
      t.string :qualification
      t.string :admin
      t.timestamps
    end
  end
end
