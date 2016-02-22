require 'csv'

class ProductsController < ApplicationController

  def list
    @products = fetch_products
  end

  def view
    @products = fetch_products
    @product = @products.find { |p| p.pid == params[:pid] }
  end

  def fetch_products
    @products = []
    CSV.foreach("mf_inventory.csv", headers: true) do |row|
    product = Product.new
    if row.to_h["quantity"].to_i > 0
    product.pid = row.to_hash["pid"]
    product.item = row.to_hash["item"]
    product.price = row.to_hash["price"]
    product.condition = row.to_hash["condition"]
    product.img_file = row.to_hash["img_file"]
    product.quantity = row.to_hash["quantity"]
    product.category = row.to_hash["category"]
    product.description = row.to_hash["description"]
    product.dimension_h = row.to_hash["dimension_h"]
    product.dimension_w = row.to_hash["dimension_w"]
    product.dimension_l = row.to_hash["dimension_l"]
    @products << product
    end
  end
  @products
 end
end
