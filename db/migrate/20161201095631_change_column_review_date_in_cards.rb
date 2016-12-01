class ChangeColumnReviewDateInCards < ActiveRecord::Migration[5.0]
  def change
    change_column :cards, :review_date, :datetime, null: false
  end
end
