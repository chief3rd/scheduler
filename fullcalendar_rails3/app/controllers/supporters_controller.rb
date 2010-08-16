class SupportersController < ApplicationController
  # GET /supporters
  # GET /supporters.xml
  def index
    @supporters = Supporter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @supporters }
    end
  end

  # GET /supporters/1
  # GET /supporters/1.xml
  def show
    @supporter = Supporter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @supporter }
    end
  end

  # GET /supporters/new
  # GET /supporters/new.xml
  def new
    @supporter = Supporter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @supporter }
    end
  end

  # GET /supporters/1/edit
  def edit
    @supporter = Supporter.find(params[:id])
  end

  # POST /supporters
  # POST /supporters.xml
  def create
    @supporter = Supporter.new(params[:supporter])

    respond_to do |format|
      if @supporter.save
        format.html { redirect_to(@supporter, :notice => 'Supporter was successfully created.') }
        format.xml  { render :xml => @supporter, :status => :created, :location => @supporter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @supporter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /supporters/1
  # PUT /supporters/1.xml
  def update
    @supporter = Supporter.find(params[:id])

    respond_to do |format|
      if @supporter.update_attributes(params[:supporter])
        format.html { redirect_to(@supporter, :notice => 'Supporter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @supporter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /supporters/1
  # DELETE /supporters/1.xml
  def destroy
    @supporter = Supporter.find(params[:id])
    @supporter.destroy

    respond_to do |format|
      format.html { redirect_to(supporters_url) }
      format.xml  { head :ok }
    end
  end
end
