class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.boolean    :go
      t.boolean    :confirmed, :default => false
      t.string     :token
      t.references :event
      t.references :user

      t.timestamps
    end
  end
end
