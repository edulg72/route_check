class RoutesController < ApplicationController
  def index
    @nav = [{'Página inicial' => "/"}]
    @routes = Route.all
  end

  def show
    @nav = [{'Página inicial' => "/"}]
    @route = Route.find(params[:id])
  end

  def new
    @nav = [{'Página inicial' => "/"}]
    @route = Route.new
  end

  def edit
    @nav = [{'Página inicial' => "/"}]
    @route = Route.find(params[:id])
  end

  def create
    @route = Route.new(routes_params)

    @route.save
    redirect_to action: :index
  end

  def update
    @route = Route.find(params[:id])

    if @route.update(routes_params)
      redirect_to @route
    else
      render 'edit'
    end
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    redirect_to action: :index
  end

  private
    def routes_params
      params.require(:route).permit(:from_name, :from_long, :from_lat, :to_name, :to_long, :to_lat, :created_by)
    end
end
