class AddFieldsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :firstname, :string, size: 100
    add_column :appointments, :lastname, :string, size: 100
    add_column :appointments, :email, :string
    add_column :appointments, :phone, :string
    add_column :appointments, :complaints, :text
    add_column :appointments, :comments, :text
    add_column :appointments, :date, :date
    add_column :appointments, :time, :time
  end
end
