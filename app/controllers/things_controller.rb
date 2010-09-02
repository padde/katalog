class ThingsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    if params[:own]
      @things = Thing.by_user(current_user).asc
    else
      @things = Thing.asc
    end
  end
  
  def show
  end
  
  def new
    @thing.credits.build(:person => current_user.person)
  end
  
  def edit
  end
  
  def create
    @thing.user = current_user
    
    if @thing.save
      redirect_to @thing, :notice => 'Thing was successfully created.'
    else
      render :action => "new"
    end
  end
  
  def update
    params[:thing][:kontext_ids] ||= []
    @thing = Thing.find(params[:id], :include => [:credits,:images])
    
    if @thing.update_attributes(params[:thing])
      redirect_to @thing, :notice => 'Thing was successfully updated.'
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @thing.destroy
    redirect_to things_url
  end
end
