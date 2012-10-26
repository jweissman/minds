class TrainingDataController < ApplicationController
  # GET /training_data
  # GET /training_data.json
  def index
    @training_data = TrainingDatum.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @training_data }
    end
  end

  # GET /training_data/1
  # GET /training_data/1.json
  def show
    @training_datum = TrainingDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @training_datum }
    end
  end

  # GET /training_data/new
  # GET /training_data/new.json
  def new
    @training_datum = TrainingDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @training_datum }
    end
  end

  # GET /training_data/1/edit
  def edit
    @training_datum = TrainingDatum.find(params[:id])
  end

  # POST /training_data
  # POST /training_data.json
  def create
    @training_datum = TrainingDatum.new(params[:training_datum])

    respond_to do |format|
      if @training_datum.save
        format.html { redirect_to @training_datum, notice: 'Training datum was successfully created.' }
        format.json { render json: @training_datum, status: :created, location: @training_datum }
      else
        format.html { render action: "new" }
        format.json { render json: @training_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /training_data/1
  # PUT /training_data/1.json
  def update
    @training_datum = TrainingDatum.find(params[:id])

    respond_to do |format|
      if @training_datum.update_attributes(params[:training_datum])
        format.html { redirect_to @training_datum, notice: 'Training datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @training_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_data/1
  # DELETE /training_data/1.json
  def destroy
    @training_datum = TrainingDatum.find(params[:id])
    @training_datum.destroy

    respond_to do |format|
      format.html { redirect_to training_data_url }
      format.json { head :no_content }
    end
  end
end
