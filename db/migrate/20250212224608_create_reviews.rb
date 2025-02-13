class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.string :body
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
