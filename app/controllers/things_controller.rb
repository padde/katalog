class ThingsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @things = Thing.all
    respond_to &:html
  end

  def show
    @thing = Thing.find(params[:id])
    respond_to &:html
  end

  def new
    @thing = Thing.new
    @thing.credits.build
    respond_to &:html
  end

  def edit
    @thing = Thing.find(params[:id])
  end

  def create
    @thing = Thing.new(params[:thing])

    respond_to do |format|
      if @thing.save
        format.html { redirect_to(@thing, :notice => 'Thing was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @thing = Thing.find(params[:id], :include => [:credits,:images])

    respond_to do |format|
      if @thing.update_attributes(params[:thing])
        format.html { redirect_to(@thing, :notice => 'Thing was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy

    respond_to do |format|
      format.html { redirect_to(things_url) }
    end
  end
end
