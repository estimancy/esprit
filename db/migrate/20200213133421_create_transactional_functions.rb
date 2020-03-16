class CreateTransactionalFunctions < ActiveRecord::Migration
  def change
    create_table :transactional_functions do |t|
      t.integer :requirement_id
      t.text :content
      t.string :tf_type
      t.string :traceability
      t.integer :det

      t.timestamps null: false
    end
  end
end
