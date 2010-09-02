class KontextsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  respond_to :html
  
  def index
    @kontexts = Kontext.all
    @kontexts = "" if @kontexts.empty?
    respond_with @kontexts
  end
  
  def show
    respond_with @kontext
  end
  
  def new
    @kontexts = Kontext.all
    respond_with @kontext
  end

  def edit
    @kontexts = Kontext.all || ""
    respond_with @kontext
  end
  
  def create
    if @kontext.save
      flash[:notice] = 'Kontext created.'
    end
    respond_with @kontext
  end
  
  def update
    if @kontext.update_attributes(params[:kontext])
      flash[:notice] = 'Kontext updated.'
    end
    respond_with @kontext
  end
  
  def destroy
    @kontext.destroy
    flash[:notice] = 'Kontext destroyed.'
    respond_with @kontext
  end
end
