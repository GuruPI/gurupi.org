class AddEnableLecturesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :enable_lectures, :boolean
  end
end
