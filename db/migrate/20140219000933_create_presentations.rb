class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|
      t.string :title
      t.references :user, index: true

      t.timestamps
    end
  end
end
