  class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :event_access, only: [:show]
  before_action :authenticate_user!, except: [:search]
  before_action :expiration, only: [:create, :update]


  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    puts "current_user is #{current_user.inspect}"
    puts "YO: #{current_user.following_users.inspect}"
    users = current_user.following_users
    @a = users.collect {|u| @event.invitations.build(user: u)}
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to event_path(@event), notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        users = current_user.following_users
        @a = users.collect {|u| @event.invitations.build(user: u)}
        puts @event.errors.full_messages
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_path(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        puts @event.errors.full_messages
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def search
    @events = Event.where(name: params[:search])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    def event_access
      if @event.private? && !current_user.invited?(@event)
        flash[:warning] = 'You do not have access to this event'
        redirect_to events_path 
      end

      # current_user.invited_events.each do |event|
      #   if event == @event
      #     invited = true
      #     break
      #   else
      #     invited = false
      #   end
      # end

      # redirect_to root_path if !invited 
    end

    def expiration
      # @event.update_attributes(expired: @event.expired?)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :instructions, :rules, :description, :deadline, :category, :prize, :privy, :bet, :entry_fee, invitations_attributes: [:user_id])
    end
end
