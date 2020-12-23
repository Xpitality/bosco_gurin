module Api
  module V1
    class ContactsController < Api::V1::ApplicationController

      def index
        contacts = Contact.all
        render json: contacts, each_serializer: ContactSerializer
      end

    end
  end
end

