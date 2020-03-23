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
 
    redirect_to "/submission"
  end
end





