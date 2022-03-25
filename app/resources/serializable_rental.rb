class SerializableRental < JSONAPI::Serializable::Resource
  type 'rentals'

  attributes :rental_id, :title, :owner, :city, :location, :category, :bedrooms, :image, :description

end