class MindsController < ApplicationController
  # GET /minds
  # GET /minds.json
  def index
    @minds = Mind.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @minds }
    end
  end

  # GET /minds/1
  # GET /minds/1.json
  def show
    @mind = Mind.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mind }
    end
  end

  # GET /minds/new
  # GET /minds/new.json
  def new
    @mind = Mind.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mind }
    end
  end

  # GET /minds/1/edit
  def edit
    @mind = Mind.find(params[:id])
  end

  # POST /minds
  # POST /minds.json
  def create
    @mind = Mind.new(params[:mind])

    respond_to do |format|
      if @mind.save
        format.html { redirect_to @mind, notice: 'Mind was successfully created.' }
        format.json { render json: @mind, status: :created, location: @mind }
      else
        format.html { render action: "new" }
        format.json { render json: @mind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /minds/1
  # PUT /minds/1.json
  def update
    @mind = Mind.find(params[:id])

    respond_to do |format|
      if @mind.update_attributes(params[:mind])
        format.html { redirect_to @mind, notice: 'Mind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minds/1
  # DELETE /minds/1.json
  def destroy
    @mind = Mind.find(params[:id])
    @mind.destroy

    respond_to do |format|
      format.html { redirect_to minds_url }
      format.json { head :no_content }
    end
  end
end
