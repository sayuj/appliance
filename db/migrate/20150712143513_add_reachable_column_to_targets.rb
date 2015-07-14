class AddReachableColumnToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :reachable, :boolean, default: false
  end
end
