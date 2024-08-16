# frozen_string_literal: true

module Api
  module V1
    # ProductsController description
    class ProductsController < ApplicationController
      # GET /api/v1/products
      def index
        products = Product.paginate(page: params[:page], per_page: 20)
        render json: { success: true, products: }
      end

      # POST /api/v1/products
      def create
        product = Product.new(product_params)
        if product.save
          render_success(product, 'Product created successfully!')
        else
          render_error(product, "Product couldn't be created successfully.")
        end
      end

      # GET /api/v1/products/:id
      def show
        product = find_product
        render json: { success: true, product: }
      end

      # PATCH/PUT /api/v1/products/:id
      def update
        product = find_product
        if product.update(product_params)
          render_success(product, 'Product updated successfully!')
        else
          render_error(product, "Product couldn't be updated successfully.")
        end
      end

      # DELETE /api/v1/products/:id
      def destroy
        product = find_product
        product.destroy
        render json: { success: true, message: 'Product destroyed successfully' }
      end

      private

      def product_params
        params.require(:product).permit(:name, :description, :price)
      end

      def find_product
        Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { success: false, message: 'Product not found' }, status: :not_found
      end

      def render_success(product, message)
        render json: {
          status: { code: 200, message: message },
          data: product
        }
      end

      def render_error(product, message)
        render json: {
          message: message, errors: product.errors
        }, status: :unprocessable_entity
      end
    end
  end
end
