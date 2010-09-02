class PeopleController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    @people = Person.asc
  end
  
  def show
  end
end
