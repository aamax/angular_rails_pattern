class MyObjectsController < ApplicationController
  require "json"
  respond_to :html, :json, :js

  def index
    @my_objects = MyObject.all
    object = respond_to do |format|
      format.html
      format.json  {render json: @my_objects}
    end
    object
  end

  def show
    @my_object = MyObject.find(params[:id])
    object = respond_to do |format|
      format.html
      format.json  {render json: @my_object}
    end
    object
  end

  def destroy
    @my_object = MyObject.find(params[:id])
    MyObject.destroy(@my_object.id)
    respond_with @my_object
  end

  def update
    obj_params = setMyObjectParamsForUpdate(params)
    @my_object = MyObject.find(params[:id])
    @my_object.update_attributes(obj_params)
    respond_with @my_object
  end

  def create
    @my_object = MyObject.create(name: params['name'], description: params['description'])
    respond_with @my_object
  end

  private

  def setMyObjectParamsForUpdate(params)
    retval = {name: params[:name], description: params[:description]}
    retval
  end
end