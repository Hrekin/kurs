class WorksheetsController < ApplicationController
  before_action :set_worksheet, only: [:show, :edit, :update, :destroy]

  # GET /worksheets
  # GET /worksheets.json
  def index
    @worksheets = Worksheet.all
  end

  # GET /worksheets/1
  # GET /worksheets/1.json
  def show
  end

  # GET /worksheets/new
  def new
    @worksheet = Worksheet.new
  end

  # GET /worksheets/1/edit
  def edit
  end

  # POST /worksheets
  # POST /worksheets.json
  def create
    @worksheet = Worksheet.new(worksheet_params)
    respond_to do |format|
      if @worksheet.save
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully created.' }
        format.json { render :show, status: :created, location: @worksheet }
      else
        format.html { render :new }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worksheets/1
  # PATCH/PUT /worksheets/1.json
  def update
    respond_to do |format|
      if @worksheet.update(worksheet_params)
        format.html { redirect_to @worksheet, notice: 'Worksheet was successfully updated.' }
        format.json { render :show, status: :ok, location: @worksheet }
      else
        format.html { render :edit }
        format.json { render json: @worksheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worksheets/1
  # DELETE /worksheets/1.json
  def destroy
    @worksheet.destroy
    respond_to do |format|
      format.html { redirect_to worksheets_url, notice: 'Worksheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worksheet
      @worksheet = Worksheet.find(params[:id])
    end
    def check_ctr_auth()
      return true if (action_name.to_sym == :index or action_name.to_sym == :show or action_name.to_sym == :new or action_name.to_sym == :edit or action_name.to_sym == :create or action_name.to_sym == :destroyor or action_name.to_sym == :update)
      return @current_role_user.present?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def worksheet_params
      params.require(:worksheet).permit(:client_id, :description_client, :hobbies, :pernicious_habits, :accommodation_type, :purpose_acquaintance, clients_attributes: [:id, :_destroy, :client_login, :client_password, :client_name, :client_sex, :client_birthday, :client_country, :client_city, :client_mail, :client_last_visit, :client_rating, :user_id])
    end
end
