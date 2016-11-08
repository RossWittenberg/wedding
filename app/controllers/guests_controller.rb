class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy, :rsvp_update, :rsvp_success]
  helper_method :sort_column, :sort_direction
  layout "rsvp", :only => [:rsvp_success]

  def rsvp_update
    respond_to do |format|
      if guest_params[:attending] === "nil"
        guest_params[:attending] = nil
      elsif guest_params[:attending] === "false"
        guest_params[:attending] = false
      else 
        guest_params[:attending] = true
      end 
      if @guest.update(guest_params)
        @rsvp_message = "#{@guest.first_name}'s status has been changed to "
        if @guest.language == "Portuguese"
          @rsvp_status = @guest.status_string_pt
        else
          @rsvp_status = @guest.status_string
        end  
        format.json { render json: { rsvp_message: @rsvp_message, guest_id: @guest.id, rsvp_status: @rsvp_status } }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  def rsvp_success
    
  end

  # GET /guests
  # GET /guests.json
  def index
    # @guests = Guest.all.order(:country, :party_name)
    @guests = Guest.order(sort_column + ' ' + sort_direction)
    @angolans = Guest.where(country: "AO")
    @americans = Guest.where(country: "US")
    @portuguese = Guest.where(country: "PT")
    @spanish = Guest.where(country: "ES")
    @danish = Guest.where(country: "DK")
    @australians = Guest.where(country: "AU")
    @belgians = Guest.where(country: "BE")
    @italians = Guest.where(country: "IT")
    @kids = Guest.where(is_child: true)
    @yesses = @guests.where(attending: true)
    @nos = @guests.where(attending: false)
    @pendings = @guests.where(attending: nil)
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def sort_column
      params[:sort] || "last_name"
    end
    
    def sort_direction
      params[:direction] || "asc"
    end

    def sort_requests_column
      params[:sort] || "start_date"
    end
    
    def set_guest
      guest_id = params[:id] || params[:guest_id]
      @guest = Guest.find(guest_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit!
    end
end
