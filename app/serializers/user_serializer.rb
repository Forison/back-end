# frozen_string_literal: true

class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name

  attribute :profile_image do |object|
    Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true) if object.image.attached?
  end
end
