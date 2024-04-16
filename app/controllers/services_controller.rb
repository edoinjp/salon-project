class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # Index action to display all services
  def index
    @services = Service.all
    # Uncomment the line below if you want to order services by a specific attribute
    # For example: order by order_sequence
    # @services = Service.order(:order_sequence)
  end

  # Show action to display details of a specific service
  def show
    @bookings = @service.bookings
  end

  # New action to create a new service
  def new
    @service = Service.new
  end

  # Create action to save a new service to the database
  def create
    @service = Service.new(service_params)

    if @service.save
      redirect_to @service, notice: 'Service was successfully created.'
    else
      render :new
    end
  end

  # Update action to update an existing service in the database
  def update
    if @service.update(service_params)
      redirect_to @service, notice: 'Service was successfully updated.'
    else
      render :edit
    end
  end

  # Destroy action to delete an existing service from the database
  def destroy
    @service.destroy
    redirect_to services_path, notice: 'Service was successfully deleted.'
  end

  private

  # Before action to set the service before showing, editing, updating, or destroying
  def set_service
    @service = Service.find(params[:id])
  end

  # Strong parameters for service creation and updating
  def service_params
    params.require(:service).permit(:name, :description, :duration, :price, :order_sequence)
  end
end
