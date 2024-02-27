class JobSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :description, :location

  attribute :poster_url do |object|
    return unless object.poster.attached?
    Rails.application.routes.url_helpers.rails_blob_url(object.poster, only_path: true) 
  end
end


