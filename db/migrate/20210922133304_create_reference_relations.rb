class CreateReferenceRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :reference_relations do |t|
      t.bigint :quoter_id
      t.string :quoter_type
      t.bigint :reference_id
      t.string :reference_type

      t.timestamps
    end

    add_index :reference_relations, [:quoter_id, :quoter_type]
    add_index :reference_relations, [:reference_id, :reference_type]
  end
end
