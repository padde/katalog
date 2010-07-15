class PeopleController < ApplicationController
  # before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  # GET /people
  # GET /people.xml
  def index
    @people = Person.asc
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  # GET /people/1
  # GET /people/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @person }
    end
  end
end
