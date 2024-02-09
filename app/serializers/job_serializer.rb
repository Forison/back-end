# frozen_string_literal: true

class JobSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :location, :poster, :logo
end
