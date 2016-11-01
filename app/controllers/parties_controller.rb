class PartiesController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy, :rsvp_update, :rsvp_success]
  layout "rsvp", :only => [:rsvp_success]

  def rsvp_update
    respond_to do |format|
      if @party.update(guest_params)
        format.html { redirect_to controller: 'parties', action: 'rsvp_success', party_id: @party.id, notice: 'Thanks for RSVP-ing!' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  def rsvp_success
    
  end

  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all.order(:party_name)
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
  end

  # GET /parties/new
  def new
    @party = Party.new
  end

  # GET /parties/1/edit
  def edit
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(guest_params)

    respond_to do |format|
      if @party.save
        format.html { redirect_to @party, notice: 'Guest was successfully created.' }
        format.json { render :show, status: :created, location: @party }
      else
        format.html { render :new }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parties/1
  # PATCH/PUT /parties/1.json
  def update
    respond_to do |format|
      if @party.update(guest_params)
        format.html { redirect_to @party, notice: 'Guest was successfully updated.' }
        format.json { render :show, status: :ok, location: @party }
      else
        format.html { render :edit }
        format.json { render json: @party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party.destroy
    respond_to do |format|
      format.html { redirect_to parties_url, notice: 'Guest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      party_id = params[:id] || params[:party_id]
      @party = Party.find(party_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:party).permit!
    end
end
