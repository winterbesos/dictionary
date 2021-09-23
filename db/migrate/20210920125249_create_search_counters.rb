class CreateSearchCounters < ActiveRecord::Migration[6.1]
  def change
    create_table :search_counters do |t|
      t.integer :count
      t.bigint :countable_id
      t.string :countable_type

      t.timestamps
    end

    add_index :search_counters, [:countable_id, :countable_type]
  end
end
