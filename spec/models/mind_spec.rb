require 'spec_helper'

module TrainingData
  def self.xor
    [
      {input: [-1,-1], output: [-1.0]},
      {input: [-1,1], output: [1.0]},
      {input: [1,-1], output: [1.0]},
      {input: [1,1], output: [-1.0]}
    ]
  end
  #def self.squared
  #  increment=10
  #  Array.new(increment) do |n|
  #    val = n.to_f/increment
  #    {input: [val], output: [val*val]}
  #  end
  #end
end

def training_data; TrainingData.xor end


describe Mind do
  def mind
    m = FactoryGirl.create(:mind,
                           :input_arity => training_data.first[:input].size,
                           :output_arity => training_data.first[:output].size)

    training_data.each do |datum|
      m.training_data.build(FactoryGirl.attributes_for(:training_datum,
                                                       :input => datum[:input],
                                                       :expected_output => datum[:output]))
    end

    [3].each_with_index do |neuron_count,position|
      m.hidden_neuron_layers.build(FactoryGirl.attributes_for(:hidden_neuron_layer,
                                                              :position => position,
                                                              :neuron_count => neuron_count))
    end
    m.save!
    m.train
    p m
    m
  end

  context "performing a simple analysis" do
    training_data.each do |datum|
      before(:all) { @mind ||= mind }

      it "should give #{datum[:output]} for #{datum[:input]}" do
        actual_result = @mind.analyze(datum[:input])
        expected, actual = datum[:output].first.to_f, actual_result.first.to_f
        #puts "========== "
        #puts "--- expected: #{expected} / actual: #{actual}"
        actual = 0.00001 if actual==0.0
        error = (((expected-actual)/actual).abs*100)
        #puts "=== percent error: #{error}"
        error.should <= 0.2
      end
    end
  end
end
