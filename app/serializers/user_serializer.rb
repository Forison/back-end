class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name

  attribute :profile_image do |object|
    if object.image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true)
    end
  end
end
