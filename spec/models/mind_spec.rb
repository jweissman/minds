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

  def self.average(opts={})
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
    elements[1..(elements.size-1)]
  end
end


def it_successfully_learns(training_set, error_tolerance, &bootstrap_block)
  it_behaves_like "it successfully learns the relationship", training_set do
    let(:training_set)     { training_set }
    let(:error_tolerance)  { error_tolerance }
    if block_given?
      puts "--- block given!"
      #let(:bootstrap_block) { bootstrap_block }
      before(:all) do
        bootstrap_block.call(current_mind)
      end
    end
  end
end

describe Mind do


  shared_examples "it successfully learns the relationship" do |testing_set|
    describe "when tested for deviation from the given relationship" do
      testing_set.each do |datum|
        before(:all) do
          @mind ||= Mind.from_training_set(training_set)
          @mind.instance_exec(boostrap_block) if defined? bootstrap_block
        end
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


  context "when performing simple analyses" do
    describe "can learn an analytic relation (XOR)" do
      #before(:all) do
      #
      #end
      it_successfully_learns(TrainingData.xor, 0.01) do |mind|
        #
        p mind
        brain = mind.brain
        p brain
      end

    end

    describe "can learn a numerical relation (mean)" do
      it_successfully_learns(TrainingData.average, 0.05)
    end

    context "can learn another numerical relation (y=x^2 and inverse)" do
      describe "training with square root" do
        it_successfully_learns(TrainingData.square_root, 0.02)
      end

      describe "training with y=x^2" do
        it_successfully_learns(TrainingData.squared, 0.02)
      end
    end
  end
end
