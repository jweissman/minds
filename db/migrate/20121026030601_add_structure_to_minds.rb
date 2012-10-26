class AddStructureToMinds < ActiveRecord::Migration
  def change
    add_column :minds, :input_arity, :integer
    add_column :minds, :output_arity, :integer
  end
end
