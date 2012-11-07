require 'spec_helper'

module TrainingData
  def self.xor
    [
      {input: [0.0,0.0], output: [0.0]},
      {input: [0.0,1.0], output: [1.0]},
      {input: [1.0,0.0], output: [1.0]},
      {input: [1.0,1.0], output: [0.0]}
    ]
  end

  DEFAULT_EXAMPLE_COUNT = 4

  def self.ranged_rand(min,max)
    min+rand(max-min)
  end

  def self.average(opts={}) #count=100)
    Array.new(opts.delete(:examples) { DEFAULT_EXAMPLE_COUNT }) do
      input = [ranged_rand(0.1,0.9), ranged_rand(0.1,0.9), ranged_rand(0.1,0.9)]
      output = [input.inject(:+)/input.size]
      {input: input, output: output}
    end
  end

  def self.squared(opts={})
    count = opts.delete(:examples) { DEFAULT_EXAMPLE_COUNT }
    Array.new(count) do |n|
      val = n.to_f/count
      {input: [val], output: [val*val]}
    end
  end

  def self.square_root(opts={})
    count = opts.delete(:examples) { DEFAULT_EXAMPLE_COUNT }
    count += 2
    elements = Array.new(count) do |n|
      val = n.to_f/count
      {input: [val*val], output: [val]}
    end
    selements[1..(elements.size-1)]
  end
end


describe Mind do
  def mind(training_set)
    m = FactoryGirl.create(:mind,
                           :input_arity => training_set.first[:input].size,
                           :output_arity => training_set.first[:output].size)

    training_set.each do |datum|
      m.training_data.build(FactoryGirl.attributes_for(:training_datum,
                                                       :input => datum[:input],
                                                       :expected_output => datum[:output]))
    end

    [3,4,5].each_with_index do |neuron_count,position|
      m.hidden_neuron_layers.build(FactoryGirl.attributes_for(:hidden_neuron_layer,
                                                              :position => position,
                                                              :neuron_count => neuron_count))
    end

    m.save!
    m.train
    p m
    m
  end

  shared_examples "it successfully learns the relationship" do |testing_set|
    describe "when tested for deviation from the given relationship" do
      testing_set.each do |datum|
        before(:all) { @mind ||= mind(training_set) }
        it "should give #{datum[:output]} when presented with #{datum[:input]}" do
          actual_result = @mind.analyze(datum[:input])
          expected, actual = datum[:output].first.to_f, actual_result.first.to_f
          puts "========== "
          puts "--- expected: #{expected} / actual: #{actual}"
          #actual = 0.00001 if actual==0.0
          #error = (((expected-actual)/actual).abs*100)
          error = (expected-actual).abs
          puts "=== raw error: #{error} / tolerance: #{error_tolerance}"
          error.should <= error_tolerance
        end
      end
    end
  end

  context "performing simple analyses" do
    describe "learning an analytic relation (XOR)" do
      it_behaves_like "it successfully learns the relationship", TrainingData.xor do
        let(:training_set)     { TrainingData.xor }
        let(:error_tolerance)  { 0.01 }
      end
    end

    describe "learning a numerical relation (mean)" do
      it_behaves_like "it successfully learns the relationship", TrainingData.average do
        let(:training_set)     { TrainingData.average }
        let(:error_tolerance)  { 0.05 }
      end
    end

    context "learning another numerical relation (y=x^2 and inverse)" do
      describe "training with square root" do
        it_behaves_like "it successfully learns the relationship", TrainingData.square_root do
          let(:training_set)     { TrainingData.square_root }
          let(:error_tolerance)  { 0.02 }
        end
      end
      describe "training with y=x^2" do
        it_behaves_like "it successfully learns the relationship", TrainingData.squared do
          let(:training_set)     { TrainingData.squared }
          let(:error_tolerance)  { 0.02 }
        end
      end
    end
  end
end
