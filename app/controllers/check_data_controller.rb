class CheckDataController < ApplicationController
  before_action :set_check_datum, only: [:show, :edit, :update, :destroy]

  # GET /check_data
  # GET /check_data.json
  def index
    authorize_user!
    if(params[:check_id])
      @check_data = CheckDatum.where("check_id="+params[:check_id])
      check = Check.find(params[:check_id])
      @check_name = check.name
    else
      @check_name = "All Recent Checks"
      @check_data = CheckDatum.all
    end
  end

  # GET /check_data/1
  # GET /check_data/1.json
  def show
    if(!user_signed_in?) 
     flash[:notice] = 'You need to sign in first' 
     redirect_to new_user_session_path
    else
     flash[:notice] = 'You need to sign in first asrsdfa' 
     redirect_to new_user_session_path
    end
  end

  # GET /check_data/new
  def new
    @check_datum = CheckDatum.new
  end

  # GET /check_data/1/edit
  def edit
  end

  # POST /check_data
  # POST /check_data.json
  def create
    @check_datum = CheckDatum.new(check_datum_params)

    respond_to do |format|
      if @check_datum.save
        format.html { redirect_to @check_datum, notice: 'Check datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @check_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @check_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /check_data/1
  # PATCH/PUT /check_data/1.json
  def update
    respond_to do |format|
      if @check_datum.update(check_datum_params)
        format.html { redirect_to @check_datum, notice: 'Check datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @check_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /check_data/1
  # DELETE /check_data/1.json
  def destroy
    @check_datum.destroy
    respond_to do |format|
      format.html { redirect_to check_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_datum
      @check_datum = CheckDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_datum_params
      params.require(:check_datum).permit(:date_checked, :check_id, :status, :response_time)
    end
end
