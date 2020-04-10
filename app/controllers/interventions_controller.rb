class InterventionsController < ApplicationController
  before_action :set_intervention, only: [:show, :edit, :update, :destroy]

  # GET /interventions
  # GET /interventions.json
  def index
    @interventions = Intervention.all
  end

  # GET /interventions/1
  # GET /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    @intervention = Intervention.new(intervention_params)
    @intervention.author_id = rand (1..20)
      p ("================================= NEW ===============================")

  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions
  # POST /interventions.json
  def create
    p ("######################### CREATE ######################################")
    puts intervention_params
    # unlocked_params = ActiveSupport::HashWithIndifferentAccess.new(intervention_params)
    @intervention = Intervention.new(intervention_params)
    @intervention.author_id = rand (1..20)
    
    

    respond_to do |format|
      if @intervention.save
        p ("+++++++++++++++++ Save OK +++++++++++++++++")
        puts ("intervention parameters: ")
        puts  intervention_params
        format.html { redirect_to @intervention, notice: 'Intervention was successfully created.' }
        format.json { render :show, status: :created, location: @intervention }
      else
        p ("$$$$$$$$$$$$ not saved - from controller $$$$$$$$$$$$$$$")
        format.html { render :new }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1
  # PATCH/PUT /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /interventions/1
  # DELETE /interventions/1.json
  def destroy
    @intervention.destroy
    respond_to do |format|
      format.html { redirect_to interventions_url, notice: 'Intervention was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # ====== Cascade menus ===========
  def get_buildings_for_customer
    puts "get_buildings_for_customer"
    puts params
    @buildings = Building.where("customer_id = ?", params[:customer_id])
    puts "here are the buildings:"
    puts @buildings
    respond_to do |format|
    format.json { render :json => @buildings }
    end
  end
  
  def get_batteries_for_building
    puts "get_batteries_for_building"
    puts params
    puts "params[:building_id]: "
    puts params[:building_id]
    @batteries = Battery.where("building_id = ?", params[:building_id])
    # @batteries = Battery.where("building_id = ?", params[:building_id])
    # params[:building_id]
    puts "here are the batteries:"
    puts @batteries
    respond_to do |format|
    format.json { render :json => @batteries }
    end
  end
  
  def get_columns_for_battery
    puts "get_columns_for_battery"
    puts params
    @columns = Column.where("battery_id = ?", params[:battery_id])
    respond_to do |format|
    format.json { render :json => @columns }
    end
  end

  def get_elevators_for_column
    puts "get_elevators_for_column"
    puts params
    @elevators = Elevator.where("column_id = ?", params[:column_id])
    respond_to do |format|
    format.json { render :json => @elevators }
    end
  end

   # Zendesk
  #  ZendeskAPI::Ticket.create!($client, :subject => "Test Ticket", :comment => { :value => "This is a test" }, :submitter_id => client.current_user.id, :priority => "urgent")

   # ZendeskAPI::Ticket.create!($client, 
   #   :subject => "#{@lead.full_name} from #{@lead.business_name}",
   #   :comment => { :value => "The contact #{@lead.full_name} from company #{@lead.business_name} can be reached 
   #   at email #{@lead.email} and at phone number #{@lead.phone}. 
   #   #{@lead.department} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators. 
   #   #{@lead.project_description}
   #   Attached Message: #{@lead.message}
   #   The Contact uploaded an attachment"},
   #   :type => "question",
   #   :priority => "normal")
     
     # redirect_to "/index"
  # ====== /Cascade menus ===========
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.fetch(:intervention, {}).permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employeeID, :start_date, :end_date, :result, :report, :status)

      # params.permit(:author_id, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employeeID, :start_date, :end_date, :result, :report, :status)
    end
end
