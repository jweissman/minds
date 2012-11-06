class HiddenNeuronLayersController < ApplicationController
  # GET /hidden_neuron_layers
  # GET /hidden_neuron_layers.json
  def index
    @hidden_neuron_layers = HiddenNeuronLayer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hidden_neuron_layers }
    end
  end

  # GET /hidden_neuron_layers/1
  # GET /hidden_neuron_layers/1.json
  def show
    @hidden_neuron_layer = HiddenNeuronLayer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hidden_neuron_layer }
    end
  end

  # GET /hidden_neuron_layers/new
  # GET /hidden_neuron_layers/new.json
  def new
    @hidden_neuron_layer = HiddenNeuronLayer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hidden_neuron_layer }
    end
  end

  # GET /hidden_neuron_layers/1/edit
  def edit
    @hidden_neuron_layer = HiddenNeuronLayer.find(params[:id])
  end

  # POST /hidden_neuron_layers
  # POST /hidden_neuron_layers.json
  def create
    @hidden_neuron_layer = HiddenNeuronLayer.new(params[:hidden_neuron_layer])

    respond_to do |format|
      if @hidden_neuron_layer.save
        format.html { redirect_to @hidden_neuron_layer, notice: 'Hidden neuron layer was successfully created.' }
        format.json { render json: @hidden_neuron_layer, status: :created, location: @hidden_neuron_layer }
      else
        format.html { render action: "new" }
        format.json { render json: @hidden_neuron_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hidden_neuron_layers/1
  # PUT /hidden_neuron_layers/1.json
  def update
    @hidden_neuron_layer = HiddenNeuronLayer.find(params[:id])

    respond_to do |format|
      if @hidden_neuron_layer.update_attributes(params[:hidden_neuron_layer])
        format.html { redirect_to @hidden_neuron_layer, notice: 'Hidden neuron layer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hidden_neuron_layer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hidden_neuron_layers/1
  # DELETE /hidden_neuron_layers/1.json
  def destroy
    @hidden_neuron_layer = HiddenNeuronLayer.find(params[:id])
    @hidden_neuron_layer.destroy

    respond_to do |format|
      format.html { redirect_to hidden_neuron_layers_url }
      format.json { head :no_content }
    end
  end
end
