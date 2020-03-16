class CreateDataFunctions < ActiveRecord::Migration

  def change

    create_table :data_functions do |t|
      t.integer :requirement_id
      t.text :content
      t.string :data_attribute
      t.string :data_type
      t.integer :ret

      t.timestamps null: false
    end

  end

end
