class PeopleController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  respond_to :html
  
  def index
    if params[:own] && user_signed_in?
      @people = Person.by_user(current_user).asc
    else
      @people = Person.asc
    end
    respond_with @people
  end
  
  def show
    respond_with @person
  end
  
  def new
    respond_with @person
  end

  def edit
    respond_with @person
  end
  
  def create
    if @person.save
      flash[:notice] = 'Person created.'
    end
    respond_with @person
  end
  
  def update
    if @person.update_attributes(params[:person])
      flash[:notice] = 'Person updated.'
    end
    respond_with @person
  end
  
  def destroy
    @person.destroy
    flash[:notice] = 'Person destroyed.'
    respond_with @person
  end
end
