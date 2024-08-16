# frozen_string_literal: true

module Api
  module V1
    module Users
      # RegistrationsController description
      class RegistrationsController < Devise::RegistrationsController
        include RackSessionsFix
        respond_to :json

        private

        def respond_with(current_user, _opts = {})
          if resource.persisted?
            render json: {
              status: { code: 200, message: 'Signed up succesfully.' },
              data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
            }
          else
            render json: {
              message: "User couldn't be created succesfully.", errors: resource.errors
            }, status: :unprocessable_entity
          end
        end
      end
    end
  end
end
