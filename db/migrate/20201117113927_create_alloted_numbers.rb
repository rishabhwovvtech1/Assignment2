class CreateAllotedNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :alloted_numbers do |t|
      t.string :phone_number
      t.boolean :special, :default => false

      t.timestamps
    end
  end
end
