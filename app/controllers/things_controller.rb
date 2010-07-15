class ThingsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  # GET /things
  # GET /things.xml
  def index
    if params[:own]
      @things = Thing.by_user(current_user).asc
    else
      @things = Thing.asc
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @things }
    end
  end

  # GET /things/1
  # GET /things/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @thing }
    end
  end

  # GET /things/new
  # GET /things/new.xml
  def new
    @thing.credits.build(:person => current_user.person)
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @thing }
    end
  end

  # GET /things/1/edit
  def edit
  end

  # POST /things
  # POST /things.xml
  def create
    @thing.user = current_user
    
    respond_to do |format|
      if @thing.save
        format.html { redirect_to(@thing, :notice => 'Thing was successfully created.') }
        format.xml  { render :xml => @thing, :status => :created, :location => @thing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /things/1
  # PUT /things/1.xml
  def update
    @thing = Thing.find(params[:id], :include => [:credits,:images])
    
    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        format.html { redirect_to(@thing, :notice => 'Thing was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @thing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /things/1
  # DELETE /things/1.xml
  def destroy
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to(things_url) }
      format.xml  { head :ok }
    end
  end
  
private
  
end
