class DropboxController < ApplicationController
# Example call:
  # GET /dropbox/auth
  def auth
    url = authenticator.authorize_url :redirect_uri => redirect_uri

    redirect_to url
  end

  # Example call:  (Authorization URL)
#   GET /dropbox/auth_callback?code=VofXAX8DO1sAAAAAAAACUKBwkDZyMg1zKT0f_FNONeA
  def auth_callback
    auth_bearer = authenticator.get_token(params[:code],
                                          :redirect_uri => redirect_uri)
    token = auth_bearer.token # This line is step 5 in the diagram.
    # token = ENV['DROPBOX_OAUTH_BEARER']  # Access Token aquired form Dropbox account

    # At this stage you may want to persist the reusable token we've acquired.
    # Remember that it's bound to the Dropbox account of your user.

    # If you persist this token, you can use it in subsequent requests or
    # background jobs to perform calls to Dropbox API such as the following.
    # folders = DropboxApi::Client.new(token).list_folder ""
    @client = DropboxApi::Client.new(token)
    puts "new client "
  end

  private

  def authenticator
    client_id = "ct3d8vfubjlmdah"
    # ENV["DROPBOX_CLIENT_ID"]
    client_secret = "l12dhdim78aeivo"
    # ENV["DROPBOX_CLIENT_SECRET_ID"]

    DropboxApi::Authenticator.new(client_id, client_secret)
  end

  def redirect_uri
    dropbox_auth_callback_url # => http://localhost:3000/dropbox/auth_callback
  end




# # from RISCfuture https://github.com/riscfuture/dropbox
# def authorize
#     if params[:oauth_token] then
#       dropbox_session = Dropbox::Session.deserialize(session[:dropbox_session])
#       dropbox_session.authorize(params)
#       session[:dropbox_session] = dropbox_session.serialize # re-serialize the authenticated session

#       redirect_to :action => 'upload'
#     else
#       dropbox_session = Dropbox::Session.new('client_id', 'client_secret')
#       session[:dropbox_session] = dropbox_session.serialize
#       redirect_to dropbox_session.authorize_url(:oauth_callback => url_for(:action => 'authorize'))
#     end
# end

# def upload
#     return redirect_to(:action => 'authorize') unless session[:dropbox_session]
#     dropbox_session = Dropbox::Session.deserialize(session[:dropbox_session])
#     return redirect_to(:action => 'authorize') unless dropbox_session.authorized?

#     if request.method == :post then
#         dropbox_session.upload params[:file], 'My Uploads'
#         render :text => 'Uploaded OK'
#     else
#         # display a multipart file field form
#     end
# end

end