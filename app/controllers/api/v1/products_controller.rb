# frozen_string_literal: true

module Api
  module V1
    # ProductsController description
    class ProductsController < ApplicationController
      before_action :set_user_by_username, only: [:user_products_by_username]

      def user_products_by_username
        products = @user.products.paginate(page: params[:page], per_page: 20)
        render json: ProductSerializer.new(products).serializable_hash.merge(
          meta: {
            current_page: products.current_page,
            total_pages: products.total_pages,
            total_entries: products.total_entries
          }
        )
      end

      # GET /api/v1/products
      def index
        products = Product.paginate(page: params[:page], per_page: 20)
        render json: {
          products: ProductSerializer.new(products).serializable_hash,
          meta: {
            current_page: products.current_page,
            total_pages: products.total_pages,
            total_entries: products.total_entries
          }
        }.to_json
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
        render json: ProductSerializer.new(product).serializable_hash.to_json
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

      def set_user_by_username
        @user = User.find_by(username: params[:username])
        unless @user
          render json: { error: 'User not found' }, status: :not_found
        end
      end

      def product_params
        params.require(:product).permit(:name, :description, :price, :photo)
      end

      def find_product
        Product.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { success: false, message: 'Product not found' }, status: :not_found
      end

      def render_success(product, message)
        render json: {
          status: { code: 200, message: message },
          data: ProductSerializer.new(product).serializable_hash
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
