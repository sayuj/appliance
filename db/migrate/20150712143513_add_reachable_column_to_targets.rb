class AddReachableColumnToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :reachable, :bool
  end
end
