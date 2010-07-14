class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    resource.people.build
    render_with_scope :new
  end
end
