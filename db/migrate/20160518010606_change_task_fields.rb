class ChangeTaskFields < ActiveRecord::Migration
  def change
    add_column :tasks, :due_date, :datetime
    add_column :tasks, :status, :string
  end
end
