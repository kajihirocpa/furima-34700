class ChangeDataBirthDayToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :birth_day, :date
  end
end
