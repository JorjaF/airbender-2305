class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :photo_url
      t.string :allies
      t.string :enemies
      t.string :affiliations
      t.references :nation, foreign_key: true

      t.timestamps
    end
  end
end
