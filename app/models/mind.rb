class Mind < ActiveRecord::Base
  attr_accessible :description, :name
  attr_accessible :input_arity, :output_arity

  has_many :training_data
  has_many :analyses

  #
  #   use training information
  #
  def train!
    all_inputs = []
    all_expected_outputs = []

     #first.is_a? String
    training_data.each do |training_datum|
      inputs = []

      training_datum.input.each do |input_element|
        p input_element
      end

      #if training_datum.is_a? String
      #  # assume it's numeric, comma-separated
      #  training_datum.input.split(',').map(&:to_f).each do |input|
      #    inputs << input
      #  end
      #  all_inputs << inputs
      #elsif training_datum.is_a? Numeric
      #  all_inputs << training_datum
      #end

      all_expected_outputs << [training_datum.expected_output.to_f]
    end

    #p all_inputs #training_data.map(&:input)
    #p all_expected_outputs #training_data.map(&:expected_output)
    #training_set = RubyFann::TrainData.new(
    #  :inputs=>all_inputs,
    #  :desired_outputs=>all_expected_outputs
    #)
    #
    ## TODO expose as parameters
    #brain.train_on_data(training_set, 1000, 1, 0.1)
  end
  #
  #def analyze(inputs)
  #  brain.run(inputs.split(',').map(&:to_f))
  #end

  private
    def brain
      # ruby-fann
      # TODO specify hidden neurons
      @brain ||= RubyFann::Standard.new(
        :num_inputs=>self.input_arity,
        :hidden_neurons=>[2, 8, 4, 3, 4],
        :num_outputs=>self.output_arity
      )
    end
end
