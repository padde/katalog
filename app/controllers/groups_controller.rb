class GroupsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    @groups = Group.asc
  end
  
  def show
  end
  
  def new
    @group.memberships.build :person => current_user.person
  end
  
  def edit
  end
  
  def create
    @group.user = current_user
    
    # TODO: is there a prettier way to do this?
    unless params[:group][:website_url].empty?
      url_regex = %r{^(https?://)}
      params[:group][:website_url] = "http://" + params[:group][:website_url] unless url_regex.match(params[:group][:website_url])
    end
    
    if @group.save
      redirect_to @group, :notice => 'Group was successfully created.'
    else
      render :action => "new"
    end
  end

  def update
    # TODO: is there a prettier way to do this?
    unless params[:group][:website_url].empty?
      url_regex = %r{^(https?://)}
      params[:group][:website_url] = "http://" + params[:group][:website_url] unless url_regex.match(params[:group][:website_url])
    end
    
    @group = Group.find(params[:id], :include => [:memberships,:images])
    
    if @group.update_attributes(params[:group])
      redirect_to @group, :notice => 'Group was successfully updated.'
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @group.destroy
    redirect_to groups_url
  end
end
