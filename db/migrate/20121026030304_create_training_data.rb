class CreateTrainingData < ActiveRecord::Migration
  def change
    create_table :training_data do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
