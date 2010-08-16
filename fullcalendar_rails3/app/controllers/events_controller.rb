class EventsController < ApplicationController
  # GET /events
  # GET /events.xml
  def index
		@events = Event.all
    @nowevents = Event.where(["startDate >= :start AND endDate <= :end", {:start=>Time.at(params['start'].to_i).to_formatted_s(:db), :end=>Time.at(params[:end].to_i).to_s(format = :db) }])

		eventsArray = [] 
    @nowevents.each do |event|
      eventsArray << {:id => event.id, :title => "#{event.supporter.name}", :start => "#{event.startDate.to_time.iso8601}", :end => "#{event.endDate.to_time.iso8601}", :className => "#{event.supporter.isIT}"}
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
			format.json  { render :json => eventsArray }
    end
  end
  
  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
   # @event = Event.new
		@event = Event.new(:endTime => 1.hour.from_now)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
			format.js
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
		respond_to do |format|
      format.html # edit.html.erb
      format.xml  { render :xml => @event }
			format.js
    end
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
		if @event.save
		  respond_to do |format|
		    format.html { redirect_to events_path }
		    format.js
		  end
		end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html {redirect_to events_path }
        format.xml  { head :ok }
				format.js
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
				format.js
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
			format.js
    end
  end

	def move
    @event = Event.find(params[:id])
    if @event
      @event.startDate = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.startDate))
      @event.endDate = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endDate))
      #@event.all_day = params[:all_day]
      @event.save
    end
  end
  
  def resize
    @event = Event.find(params[:id])
    if @event
      @event.endDate = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.endDate))
      @event.save
    end    
  end
end
