class StudyModulesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource
  
  def index
    if params[:own] && user_signed_in?
      @study_modules = StudyModule.by_user(current_user).asc
    else
      @study_modules = StudyModule.asc
    end
  end
  
  def show
  end
  
  def new
  end
  
  def edit
  end
  
  def create
    if @study_module.save
      redirect_to @study_module, :notice => 'Study Module was successfully created.'
    else
      render :action => "new"
    end
  end
  
  def update
    if @study_module.update_attributes(params[:study_module])
      redirect_to @study_module, :notice => 'Study Module was successfully updated.'
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @study_module.destroy
    redirect_to study_modules_url, :notice => 'Study Module destroyed.'
  end
end
