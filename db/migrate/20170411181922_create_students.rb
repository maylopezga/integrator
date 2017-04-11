class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :lastname
      t.string :code
      t.string :email
      t.string :cel

      t.timestamps
    end
  end
end
