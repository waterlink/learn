class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :content
      t.references :presentation, index: true

      t.timestamps
    end
  end
end
