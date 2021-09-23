class CreateNouns < ActiveRecord::Migration[6.1]
  def change
    create_table :nouns do |t|
      t.string :name
      t.string :s_name
      t.string :description
      t.string :en_name
      t.string :en_s_name

      t.timestamps
    end
  end
end
