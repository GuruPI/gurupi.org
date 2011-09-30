class AddRelativeVotesToLectures < ActiveRecord::Migration
  def change
    add_column :lectures, :relative_votes, :integer
  end
end
