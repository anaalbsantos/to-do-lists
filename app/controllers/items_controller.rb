class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: %i[ show edit update destroy ]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = @list.items.new
  end

  def create
    @item = @list.items.new(item_params)
    if @item.save
      redirect_to lists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to lists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to lists_path
  end

  private
    def set_list
      @list = List.find(params[:list_id])
    end

    def set_item
      @item = @list.items.find(params[:id])
    end

    def item_params
      params.expect(item: [ :description ])
    end
end
