class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.all
  end

  def new
  end

  def create
    @organization = Organization.create(
      school: params[:school],
      name: params[:name],
      color: params[:color],
      logo: params[:logo],
      motto: params[:motto]
    )
    redirect_to "/organizations/#{@organization.id}"
  end

  def show
      @organization = Organization.find_by(id: params[:id])
  end

  def edit
      @organization = Organization.find_by(id: params[:id])
  end

  def update
    @organization = Organization.find_by(id: params[:id])
    @organization.update(
      school: params[:school],
      name: params[:name],
      color: params[:color],
      logo: params[:logo],
      motto: params[:motto]
    )
    redirect_to "/organizations/#{@organization.id}"
  end

  def destroy
    organization = Organization.find_by(id: params[:id])
    organization.destroy
    redirect_to '/organizations'
  end
end


