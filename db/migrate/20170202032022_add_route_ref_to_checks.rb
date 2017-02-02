class AddRouteRefToChecks < ActiveRecord::Migration
  def change
    add_reference :checks, :route, index: true, foreign_key: true
  end
end
