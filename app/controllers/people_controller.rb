class PeopleController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
    @people = Person.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @person = Person.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to(@person, :notice => 'Person was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @person = Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(@person, :notice => 'Person was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to(people_url) }
    end
  end
end
