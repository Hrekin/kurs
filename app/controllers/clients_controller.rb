class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  def client_search
    #raise params['search'].inspect
    if params.has_key?('search')
      @clients = Client.search(params['search'])   
    else
      @clients = []
    end 
    params['search']||={}
  end
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end
#ip_path  GET /welcome/insufficient_privileges(.:format)  welcome#insufficient_privileges
  # POST /clients
  # POST /clients.json
  def create
    
    @client = Client.new(client_params)
    #@client.client_mail = @current_user.email
    @client.user_id = User.where(:email => @current_user.email).first.id
    @client.client_rating = (Client.last.client_rating.to_i + 1)
    @client.client_last_visit = Time.now
    #raise "#{Client.last.client_rating + 1}"
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
     respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    def check_ctr_auth()
      return true if (action_name.to_sym == :index or action_name.to_sym == :show or action_name.to_sym == :new or action_name.to_sym == :edit or action_name.to_sym == :create or action_name.to_sym == :update) or (@current_role_user.try(:is_admin?))
      return @current_role_user.present?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:client_login, :client_password, :client_name, :client_sex, :client_birthday, :client_country, :client_city, :client_mail, :client_last_visit, :client_rating, :user_id)
    end
end
