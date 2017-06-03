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
    @worksheet.build_client
  end

  # GET /worksheets/1/edit
  def edit
  end

  # POST /worksheets
  # POST /worksheets.json
  def create
    #params[:worksheet][:pernicious_habits].delete("")
    #str = ""
    #params[:worksheet][:pernicious_habits].map { |e|  (e != params[:worksheet][:pernicious_habits][-1]) ? str += e + ", " : str += e }
    #raise params.inspect
    @worksheet = Worksheet.new(worksheet_params)
    #@worksheet.pernicious_habits = str
    #@worksheet.client.client_last_visit = Time.now
    @worksheet.pernicious_habits = @worksheet.pernicious_habits.delete!("[, ], \"")
    @worksheet.client.client_rating = (Client.last.client_rating.to_i + 1)
    @worksheet.client.user_id = User.find_by_email("#{@current_user.email}").id
    respond_to do |format|
      if @worksheet.save
        format.html { redirect_to @worksheet, notice: 'Анкета была успешно создана.' }
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
    #raise params[:worksheet][:pernicious_habits].inspect
    #str = ""
    #params[:worksheet][:pernicious_habits].map { |e|  (e != params[:worksheet][:pernicious_habits][-1]) ? str += e + ", " : str += e }
    #raise str.inspect
    respond_to do |format|
      #@worksheet.pernicious_habits = str
      if @worksheet.update(worksheet_params)
        @worksheet.pernicious_habits = @worksheet.pernicious_habits.delete!("[,], \"")
        #raise @worksheet.inspect
        format.html { redirect_to @worksheet, notice: 'Анкета была успешно обновлена.' }
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
      format.html { redirect_to worksheets_url, notice: 'Анкета была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worksheet
      @worksheet = Worksheet.find(params[:id])
    end
    def check_ctr_auth()
      return true if (action_name.to_sym == :index or action_name.to_sym == :show or action_name.to_sym == :new or action_name.to_sym == :edit or action_name.to_sym == :create  or action_name.to_sym == :update)
      return @current_role_user.present?
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def worksheet_params
      params.require(:worksheet).permit(:client_id, :description_client, :hobbies,  :accommodation_type, :purpose_acquaintance, client_attributes: [:id, :_destroy, :client_name, :client_sex, :client_country, :client_city, :client_rating, :user_id], pernicious_habits: [])
    end
end
