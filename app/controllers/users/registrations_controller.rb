class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_person
    # debugger
    render_with_scope :new
  end
  
  def edit
    # @user = User.find(params[:id])
    render_with_scope :edit
  end
end
