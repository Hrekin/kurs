class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new

  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.client.client_last_visit = Time.now
    r = Client.last.client_rating.to_i + 1
    u = User.find_by_email("#{@current_user.email}").id
    if @payment.client.user_id.nil? and @payment.client.client_rating.nil?
      @payment.client.client_rating = r
      @payment.client.user_id = u      
    end
    #raise "#{@payment.inspect}"
    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end
    def check_ctr_auth()
      return true if (action_name.to_sym == :index or action_name.to_sym == :show or action_name.to_sym == :new or action_name.to_sym == :edit or action_name.to_sym == :create or action_name.to_sym == :update)
      return @current_role_user.present?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:client_id, :service_type, :price, :payment_time, :validity_service, client_attributes: [:id, :_destroy, :client_login, :client_password, :client_name, :client_sex, :client_birthday, :client_country, :client_city, :client_mail, :client_last_visit, :client_rating, :user_id])
    end
end
