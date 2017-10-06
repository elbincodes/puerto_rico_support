class ConnectionsController < ApplicationController
  def index
    @connections = Connection.all
  end

  # def new
  #   a = Users.find_by(params[:id])
  #   b = Organizations.find_by(params[:id])
  #   @connection = Connection.new(user_id: a.id, organization_id: b)
  # end

  def create

    @connection = Connection.new(user_id: current_user.id, organization_id: params[:id], admin: false)
    if @connection.save
      redirect_to organization_path(@connection.organization), notice: 'Connection to organization has been established.'
    else
      render "/organizations/index", notice: 'Connection was not made'
    end
  end

  def destroy
    @connection = Connection.find(params[:id])
    @connection.destroy
    redirect_to organizations_path, notice: 'Your connection to this organization has been terminated.'
  end


  private

  def connection_params
    params.require(:connection).permit(:user_id, :organization_id, :admin)
  end
end
