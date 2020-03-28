class QuotesController < ApplicationController


  def submission

  end

  def create

    #Quote.create(params)

      @quote = Quote.create(
        firstName: params[:fullName],
        phoneNumber: params[:phoneNumber],
        companyName: params[:companyName],
        email: params[:email],
        buildingType: params[:departmentSelector],
        productGrade: params[:quality],
        nbAppartment: params[:apartment],
        nbBusiness: params[:companie],
        nbFloor: params[:floor],
        nbBasement: params[:basement],
        nbCage: params[:cage],
        nbParking: params[:parking],
        nbOccupantFloor: params[:occupant],
        nbOperatingHours: params[:activity],
        nbElevatorNeeded: params[:elevator_needed],
        instllationCost: params[:installation_cost],
        totalCost: params[:total_cost]
      )

      ZendeskAPI::Ticket.create!($client, 
        :subject => "#{@quote.firstName} from #{@quote.companyName}",
        :comment => { :value => "The contact #{@quote.firstName} from company #{@quote.companyName} can be reached 
        at email #{@quote.email} and at phone number #{@quote.phoneNumber}. 
        The building type is #{@quote.buildingType} and there are #{@quote.nbElevatorNeeded} elevator cages required. 
        The total cost is #{@quote.totalCost} $ and the potential customer needs to be followed by Rocket Elevators sales representative."}, 
        :type => 'task',
        :priority => "normal")
 
    redirect_to "/submission"
  end

end





