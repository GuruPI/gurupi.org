class AddPlaceUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :place_url, :string
  end
end
