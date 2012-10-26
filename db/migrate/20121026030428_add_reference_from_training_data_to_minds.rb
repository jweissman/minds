class AddReferenceFromTrainingDataToMinds < ActiveRecord::Migration
  def change
    add_column :training_data, :mind_id, :reference
  end
end
