class Mind < ActiveRecord::Base
  attr_accessible :description, :name
  attr_accessible :input_arity, :output_arity

  has_many :training_data
  has_many :analyses

  def train
    all_inputs = []
    all_expected_outputs = []
    training_data.each do |training_datum|
      inputs = []
      training_datum.input.split(',').map(&:to_f).each do |input|
        inputs << input
      end
      all_inputs << inputs
      all_expected_outputs << [training_datum.expected_output.to_f]
    end

    p all_inputs #training_data.map(&:input)
    p all_expected_outputs #training_data.map(&:expected_output)
    training_set = RubyFann::TrainData.new(
      :inputs=>all_inputs,
      :desired_outputs=>all_expected_outputs
    )
    #
    #brain.train_on_data(training_set, 1000, 1, 0.1)
  end

  def classify(input); brain.run(input) end

  def brain
    # ruby-fann
    @brain ||= RubyFann::Standard.new(
      :num_inputs=>self.input_arity,
      :hidden_neurons=>[2, 8, 4, 3, 4],
      :num_outputs=>self.output_arity
    )
  end
end
