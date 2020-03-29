RailsAdmin.config do |config|
  ### Popular gems integration
  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user

  # end
  # config.current_user_method(&:current_user)



   config.authorize_with do

     redirect_to main_app.root_path unless current_user.is_employee(current_user.email)
   end
 


  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
  config.navigation_static_links = {
    'Charts' => '/blazer/dashboards/1-1' #or whatever you used to mount RailsAdmin in your routes file
  }

  config.navigation_static_links = {
  'Dashboard' => '/blazer/dashboards/1-dashboard-query', #or whatever you used to mount RailsAdmin in your routes file
  'GoogleMap' => '/map' #or whatever you used to mount RailsAdmin in your routes file
}

# config.navigation_static_links = {
# }

  config.actions do
    dashboard                     
    index                         # mandatory
    new
    export
    bulk_delete 
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end

