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
      @verified = (@organization.users.where(id: current_user.id).any?)
    end
  end

  def create
    @organization = Organization.new(organization_params)
    if @organization.save
      UserOrganization.create(user_id: current_user.id, organization_id: @organization.id, admin: true)
      redirect_to organization_path(@organization), notice: 'Organization was successfully created.'
    else
      render :new
    end
  end

  def edit
    set_organization
  end

  def destroy
    set_organization
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
