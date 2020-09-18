class CreatePackages < ActiveRecord::Migration[6.0]
  def change
    create_table :packages do |t|
      t.string :parcel
      t.string :status
      t.string :guide_number
      t.string :description

      t.timestamps
    end
  end
end
