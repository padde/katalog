class ContextsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  respond_to :html
  
  def index
    @contexts = Context.all
    @contexts = "" if @contexts.empty?
    respond_with @contexts
  end
  
  def show
    respond_with @context
  end
  
  def new
    @contexts = Context.all
    respond_with @context
  end

  def edit
    @contexts = Context.all || ""
    respond_with @context
  end
  
  def create
    if @context.save
      flash[:notice] = 'Context created.'
    end
    respond_with @context
  end
  
  def update
    if @context.update_attributes(params[:context])
      flash[:notice] = 'Context updated.'
    end
    respond_with @context
  end
  
  def destroy
    @context.destroy
    flash[:notice] = 'Context destroyed.'
    respond_with @context
  end
end
