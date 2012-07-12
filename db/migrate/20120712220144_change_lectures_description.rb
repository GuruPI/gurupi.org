class ChangeLecturesDescription < ActiveRecord::Migration
  def up
    change_column :lectures, :description, :text
  end

  def down
    change_column :lectures, :description, :string
  end
end