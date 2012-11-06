class TrainingDatum < ActiveRecord::Base
  attr_accessible :description, :name, :mind_id
  attr_accessible :input, :expected_output

  serialize :input, Array
  serialize :expected_output, Array

  belongs_to :mind
end
