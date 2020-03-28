require 'pry-byebug'
class PagesController < ApplicationController
  
  before_action :authenticate_user!, only: [:dashboard]
  
  skip_before_action :verify_authenticity_token
  require 'sendgrid-ruby'
  include SendGrid

  def index

  end

  def create

    @lead = Lead.create(
      full_name: params[:contact_full_Name],
      business_name: params[:contact_business_name],
      email: params[:contact_email],
      phone: params[:contact_phone],
      project_name: params[:contact_project_name],
      project_description: params[:contact_project_description],
      department: params[:contact_department],
      message: params[:contact_message],
      file_attachment: params[:contact_attachment]
    )
 
    data = {
      personalizations: [
        {
          to: [
            {
              email: @lead.email
            }
          ],
          dynamic_template_data: {
              subject: "Thank you for contacting us!",
              full_name: @lead.full_name,
              project_name: @lead.project_name
          },
        }
      ],
      from: {
        email: "info@rocketelevatorsworld.com"
      },
      template_id: "d-914f77d8b1a546c3b80d6d6ba05bd4e7"
    }
    puts "********************************************"
    sg = SendGrid::API.new(api_key: "#{ENV['SENDGRID_API_KEYYY']}")
    puts sg
    puts "********************************************"
    response = sg.client.mail._("send").post(request_body: data)
    puts response.as_json
    puts "********************************************"

    ZendeskAPI::Ticket.create!($client, 
      :subject => "#{@lead.full_name} from #{@lead.business_name}",
      :comment => { :value => "The contact #{@lead.full_name} from company #{@lead.business_name} can be reached 
      at email #{@lead.email} and at phone number #{@lead.phone}. 
      #{@lead.department} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators. 
      #{@lead.project_description}
      Attached Message: #{@lead.message}
      The Contact uploaded an attachment"},
      :type => "question",
      :priority => "normal")

    redirect_to "/index"
  end


def home
   
end

  #  def login
  #    session[:test] = "Valeur de test"
  #  end

  #  def logout
  #    session[:user_id] = nil
  #    flash[:info] = "Vous êtes maintenant déconnecté."
  #    redirect_to "/index"
  #  end
   

  #  def check
  #    @current_user = User.where(userID: params[:userID], password: params[:password]).first
  #    if @current_user
  #      session[:user_id] = @current_user.id
  #      flash[:info] = "Vous êtes maintenant connecté"
  #      redirect_to "/login"
  #    else
  #      session[:user_id] = nil
  #       flash[:info] = "Échec de la connexion"
  #      redirect_to "/login"
  #    end
  #   end

    def admin
      @all_Quotes = Quote.all

      if @current_user.try(:title) != "employee"
        flash[:error] = "ACCES DENIED"
        return redirect_to request.referrer || "/home"
      end
      @users = User.all
    end

  
  
  # def employee
  #   @all_Quotes = Quote.all

  #     if @current_user.try(:title) != "employee"
  #       flash[:error] = "ACCES DENIED"
  #       return redirect_to request.referrer || "/home"
  #     end
  #     @users = User.all
  #   end

    # def userinfo
    # @all_Quotes = Quote.all
    # @users = User.all

    # end

    def dashboard
      @all_Quotes = Quote.all

     end
  
    # def createUser

    #   @user = User.create(

    #     userID: params[:userID],
    #     password: params[:password],
    #     phoneNumber: params[:phoneNumber],
    #     firstName: params[:firstName],
    #     lastName: params[:lastName],
    #     email: params[:email],
    #     companyName: params[:companyName],
    #     title: params[:title]
    #   )
    #     redirect_to "/login"
    # end
end



=begin   def userinfo
    @les_users = User.all
  end

  def show
    @le_user = User.find(params[:id])

  end

  def create
    
    User.create name: params[:name]
  

    redirect_to "/userinfo"
  end

  def update

    @le_user = User.find(params[:id])
    @le_user.name = params[:name]
    @le_user.save
    redirect_to "/userinfo/#{params[:id]}"

  end


  
  def residential
  end

  def corporate
  end

  def submisison
  end
=end




