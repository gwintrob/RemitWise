class RemittancesController < ApplicationController
  # GET /remittances
  # GET /remittances.json
  def index
    @remittances = Remittance.all
    @remittance_months = @remittances.group_by { |remittance| remittance.date.beginning_of_month }

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @remittances }
    end
  end

  # GET /remittances/1
  # GET /remittances/1.json
  def show
    @remittance = Remittance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @remittance }
    end
  end

  # GET /remittances/new
  # GET /remittances/new.json
  def new
    @remittance = Remittance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @remittance }
    end
  end

  # GET /remittances/1/edit
  def edit
    @remittance = Remittance.find(params[:id])
  end

  # POST /remittances
  # POST /remittances.json
  def create
    @remittance = Remittance.new(params[:remittance])

    respond_to do |format|
      if @remittance.save
        format.html { redirect_to @remittance, notice: 'Remittance was successfully created.' }
        format.json { render json: @remittance, status: :created, location: @remittance }
      else
        format.html { render action: "new" }
        format.json { render json: @remittance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /remittances/1
  # PUT /remittances/1.json
  def update
    @remittance = Remittance.find(params[:id])

    respond_to do |format|
      if @remittance.update_attributes(params[:remittance])
        format.html { redirect_to @remittance, notice: 'Remittance was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @remittance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /remittances/1
  # DELETE /remittances/1.json
  def destroy
    @remittance = Remittance.find(params[:id])
    @remittance.destroy

    respond_to do |format|
      format.html { redirect_to remittances_url }
      format.json { head :ok }
    end
  end
end
