class QqQsController < ApplicationController
  before_action :set_qqq, only: [:show, :edit, :update, :destroy]

  # GET /qqqs
  # GET /qqqs.json
  def index
    @qqqs = Qqq.all
  end

  # GET /qqqs/1
  # GET /qqqs/1.json
  def show
  end

  # GET /qqqs/new
  def new
    @qqq = Qqq.new
  end

  # GET /qqqs/1/edit
  def edit
  end

  # POST /qqqs
  # POST /qqqs.json
  def create
    @qqq = Qqq.new(qqq_params)

    respond_to do |format|
      if @qqq.save
        format.html { redirect_to @qqq, notice: 'Qqq was successfully created.' }
        format.json { render :show, status: :created, location: @qqq }
      else
        format.html { render :new }
        format.json { render json: @qqq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qqqs/1
  # PATCH/PUT /qqqs/1.json
  def update
    respond_to do |format|
      if @qqq.update(qqq_params)
        format.html { redirect_to @qqq, notice: 'Qqq was successfully updated.' }
        format.json { render :show, status: :ok, location: @qqq }
      else
        format.html { render :edit }
        format.json { render json: @qqq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qqqs/1
  # DELETE /qqqs/1.json
  def destroy
    @qqq.destroy
    respond_to do |format|
      format.html { redirect_to qqqs_url, notice: 'Qqq was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qqq
      @qqq = Qqq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qqq_params
      params.require(:qqq).permit(:qq)
    end
end
