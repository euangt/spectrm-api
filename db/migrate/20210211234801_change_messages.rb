class ChangeMessages < ActiveRecord::Migration[6.0]
  def change
    change_column :messages, :retrieval_count, :interger, :default => 0
  end
end
