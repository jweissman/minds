class Mind < ActiveRecord::Base
  attr_accessible :description, :name
  attr_accessible :input_arity, :output_arity
  attr_accessible :hidden_neuron_layers_attributes

  #attr_accessible :hidden_neurons
  has_many :hidden_neuron_layers, :order => "position"

  after_create :bootstrap
  accepts_nested_attributes_for :hidden_neuron_layers

  # array of integers which indicate desired hidden neuron structure
  #serialize :hidden_neurons, Array

  has_many :training_data
  has_many :analyses

  def analyze!(input)
    puts "--- about to train and analyze..."
    train
    analyze(input)
  end



  def analyze(input)
    if input.is_a? Array and input.all? { |e| e.is_a? Numeric }
      @brain.run(input)
    else
      p input
      raise "Expecting array of numbers!"
    end
  end


  def build_hidden_neuron_layers #_from_int_array
    hidden_neuron_layers.build({:position => 0, :neuron_count => input_arity})
    5.times do |n|
      hidden_neuron_layers.build({:position => n+1, :neuron_count => 2+rand(5)})
    end
    hidden_neuron_layers.build({:position => 6, :neuron_count => output_arity})
  end


  # from ruby-fann docs:
  #   max_epochs - The maximum number of epochs the training should continue
  #   epochs_between_reports - The number of epochs between printing a status report to stdout.
  #   desired_error - The desired <get_MSE> or <get_bit_fail>, depending on which stop function
  #                   is chosen by <set_train_stop_function>.
  #10000, 1000, 0.0
  def train(sample_data=training_set,max_epochs=1000,epochs_between_reports=1000,desired_error=0.0001)
    #p sample_data
    if sample_data.is_a? RubyFann::TrainData

      @brain.init_weights(sample_data)
      @brain.train_on_data(sample_data, max_epochs, epochs_between_reports, desired_error)
    else
      p sample_data
      raise "Expecting Ruby::Fann training set!"
    end
  end

  private

  def training_set
    unless training_data.all? { |data| data.input.is_a? Array and data.input.all? { |e| e.is_a? Numeric }}
      unless training_data.all? { |data| data.expected_output.is_a? Array and data.expected_output.all? { |e| e.is_a? Numeric }}
        raise "Mind#train! currently raises errors unless given numeric-valued input data for debugging purposes"
      end
    end

    input = training_data.map(&:input) # []
    output = training_data.map(&:expected_output)

    p input
    p output

    RubyFann::TrainData.new(inputs: input, desired_outputs: output)
  end

  def bootstrap
    @brain = RubyFann::Standard.new(
      num_inputs: self.input_arity,
      hidden_neurons: self.hidden_neuron_layers.map(&:neuron_count),
      num_outputs: self.output_arity
    )

    #@brain.set_activation_steepness_hidden(1.0)
    #@brain.set_activation_steepness_output(1.0)

    #@brain.set_activation_function_hidden(:sigmoid_symmetric)
    #@brain.set_activation_function_output(:sigmoid_symmetric)
    #
    #bit_fail = 0.001
    #@brain.set_train_stop_function(:bit)
    #@brain.set_bit_fail_limit(bit_fail)
  end
end
