class GroupsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.asc
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group.memberships.build :person => current_user.person
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group.user = current_user
    
    # TODO: is there a prettier way to do this?
    unless params[:group][:website_url].empty?
      url_regex = %r{^(https?://)}
      params[:group][:website_url] = "http://" + params[:group][:website_url] unless url_regex.match(params[:group][:website_url])
    end
    
    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group, :notice => 'Group was successfully created.') }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    # TODO: is there a prettier way to do this?
    unless params[:group][:website_url].empty?
      url_regex = %r{^(https?://)}
      params[:group][:website_url] = "http://" + params[:group][:website_url] unless url_regex.match(params[:group][:website_url])
    end
    
    @group = Group.find(params[:id], :include => [:memberships,:images])
    
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to(@group, :notice => 'Group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
