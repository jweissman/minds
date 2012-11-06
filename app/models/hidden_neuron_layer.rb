class HiddenNeuronLayer < ActiveRecord::Base
  attr_accessible :mind_id, :neuron_count, :position
  belongs_to :mind
end
