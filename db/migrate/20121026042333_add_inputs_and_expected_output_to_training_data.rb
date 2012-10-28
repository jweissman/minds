class AddInputsAndExpectedOutputToTrainingData < ActiveRecord::Migration
  def change
    add_column :training_data, :input, :text
    add_column :training_data, :expected_output, :text
  end
end
