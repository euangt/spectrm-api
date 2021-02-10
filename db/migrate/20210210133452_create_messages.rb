class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.text :content
      t.integer :retrieval_count

      t.timestamps
    end
  end
end
