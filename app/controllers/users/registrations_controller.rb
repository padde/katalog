class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.build_person
    render_with_scope :new
  end
  
  def edit
    render_with_scope :edit
  end
end
