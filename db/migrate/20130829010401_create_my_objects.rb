class CreateMyObjects < ActiveRecord::Migration
  def change
    create_table :my_objects do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
