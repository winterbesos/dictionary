class AddNounRefToRecord < ActiveRecord::Migration[6.1]
  def change
    add_reference :records, :noun, null: false, foreign_key: true
  end
end
