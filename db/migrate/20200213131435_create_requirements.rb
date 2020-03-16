class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.text :content
      t.float :storypoint

      t.timestamps null: false
    end
  end
end
