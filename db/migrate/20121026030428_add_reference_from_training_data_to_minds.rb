class AddReferenceFromTrainingDataToMinds < ActiveRecord::Migration
  def change
    add_column :training_data, :mind_id, :integer
  end
end
