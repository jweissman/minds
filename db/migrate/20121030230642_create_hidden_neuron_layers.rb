class CreateHiddenNeuronLayers < ActiveRecord::Migration
  def change
    create_table :hidden_neuron_layers do |t|
      t.integer :mind_id
      t.integer :neuron_count
      t.integer :position

      t.timestamps
    end
  end
end
