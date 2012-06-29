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

    email = @remittance.recipient_email

    user = User.find_by_email email

    @remittance.user = current_user

    params[:intended_uses].each do |use_hash|
      if not use_hash[:use].empty? and not use_hash[:money_amount].empty?
        use = IntendedUse.new use_hash
        @remittance.intended_uses.push use
      end
    end

    if user
      if current_user.receivers.include? user
        @remittance.recipient_id = user.id
        respond_to do |format|
          if @remittance.save
            format.html { redirect_to @remittance, notice: 'Remittance was successfully created.' }
            format.json { render json: @remittance, status: :created, location: @remittance }
          else
            format.html { render action: "new" }
            format.json { render json: @remittance.errors, status: :unprocessable_entity }
          end
        end
      else
        Invitation.new({:user_id => current_user.id, :recipient_email => email}).save

        # TODO: send invitation email here

        respond_to do |format|
          if @remittance.save
            format.html { redirect_to @remittance, notice: "Remittance was successfully created; an invitation to join RemitWise was sent to #{email}" }
          end
        end
      end
  end

  # PUT /remittances/1
  # PUT /remittances/1.json
  def update
    @remittance = Remittance.find(params[:id])
    
    intended_uses_list = []
    
    params[:intended_uses].each do |use_hash|
      if not use_hash[:use].empty? and not use_hash[:money_amount].empty?
        use = IntendedUse.new use_hash
        indended_uses_list.push use
      end
    end

    # we use a temporary list instead of directly pushing so that items can be removed
    @remittance.intended_uses = intended_uses_list 

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
