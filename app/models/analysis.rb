class Analysis < ActiveRecord::Base
  attr_accessible :inputs, :mind_id, :output
  belongs_to :mind
  before_save :analyze!

  def analyze!
    self.output = self.mind.analyze(self.inputs)
  end
end
