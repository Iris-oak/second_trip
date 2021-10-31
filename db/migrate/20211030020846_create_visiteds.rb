class CreateVisiteds < ActiveRecord::Migration[6.0]
  def change
    create_table :visiteds do |t|
      t.references :user, null: false, foreign_key: true
      t.date :visited_date
      t.references :attraction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
