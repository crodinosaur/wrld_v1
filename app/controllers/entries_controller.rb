class EntriesController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  # before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]

  before_action :authenticate_user!

  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @event = Event.find(params[:event_id])
    @entry = Entry.new
    @video = Video.new(entry: @entry)
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @event = Event.find(params[:event_id])
    @entry.event = @event

    respond_to do |format|
      if @entry.save
        format.html { redirect_to event_entry_path(@event, @entry), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to event_entry_path(@event, @entry), notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to event_path(@event), notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @user = current_user
      @entry = Entry.find(params[:id])
      @event = Event.find(params[:event_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:score, :terms, :tos, video_attributes: [:video_url, :video_url_cache])
    end
end
