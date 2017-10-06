class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def show
    set_organization
    if current_user
      @verified = Connection.where(user_id: current_user.id, admin: true).any?
    end
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      Connection.create(user_id: current_user.id, organization_id: @organization.id, admin: true)
      redirect_to organization_path(@organization), notice: 'Organization was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_organization
    if @organization.users.exclude?(current_user) && current_user.connection.admin == false
      redirect_to organization_path(@organization), notice: "UNAUTHORIZED ACCESS: This is NOT your organization!!!"
    end
  end

  def destroy
    set_organization
    # if @organization.users.exclude?(current_user)
    #   redirect_to organization_path(@organization), notice: "UNAUTHORIZED ACCESS: This is NOT your organization!!!"
    # end
    @organization.destroy
    redirect_to organizations_path, notice: "Organization was successfully deleted."
  end

  def update
    set_organization
    if @organization.update(organization_params)
      redirect_to organization_path(@organization), notice: 'Organization was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end

  def organization_params
    params.require(:organization).permit(:name, :website, :info)
  end

end
