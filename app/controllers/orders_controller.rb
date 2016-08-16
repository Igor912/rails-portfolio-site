class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :new, :create]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(permit_comment)
    if @order.save
      flash[:notice] = "Замовлення успішно надіслано! Очікуйте на дзвінок!"
      redirect_to order_path(@order)
    else
      flash[:error] = @order.errors.full_messages
      redirect_ro new_order_path
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(params[:order].permit(:name, :phone_number, :trip_from, :trip_to, :date_of_departure, :notes))
      redirect_to @order
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private
    def permit_comment
      params.require(:order).permit(:name, :phone_number, :trip_from, :trip_to, :date_of_departure, :notes)
    end

end
