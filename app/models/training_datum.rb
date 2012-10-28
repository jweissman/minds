class TrainingDatum < ActiveRecord::Base
  attr_accessible :description, :name, :mind_id
  attr_accessible :input, :expected_output
  belongs_to :mind
  serialize :input
  serialize :expected_output
  after_save :retrain_mind

  def retrain_mind
    self.mind.train
  end
end
