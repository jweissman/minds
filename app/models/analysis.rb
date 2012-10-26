class Analysis < ActiveRecord::Base
  attr_accessible :inputs, :mind_id, :output
  belongs_to :mind
end
