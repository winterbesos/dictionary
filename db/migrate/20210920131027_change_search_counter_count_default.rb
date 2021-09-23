class ChangeSearchCounterCountDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :search_counters, :count, to: 0
  end
end
