class DonationsController < ApplicationController

  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.all
  end

  # GET /Donations/1
  # GET /Donations/1.json
  def show
  end

  # GET /Donations/new
  def new
    @Donation = Donation.new
  end

  # GET /Donations/1/edit
  def edit
  end

  # POST /Donations
  # POST /Donations.json
  def create
    @Donation = Donation.new(donation_params)

    respond_to do |format|
      if @Donation.save
        format.html { redirect_to @Donation, notice: 'Donation was successfully created.' }
        format.json { render :show, status: :created, location: @Donation }
      else
        format.html { render :new }
        format.json { render json: @Donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Donations/1
  # PATCH/PUT /Donations/1.json
  def update
    respond_to do |format|
      if @Donation.update(donation_params)
        format.html { redirect_to @Donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @Donation }
      else
        format.html { render :edit }
        format.json { render json: @Donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Donations/1
  # DELETE /Donations/1.json
  def destroy
    @Donation.destroy
    respond_to do |format|
      format.html { redirect_to Donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @Donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:sender_id, :recipient_id)
    end
end
