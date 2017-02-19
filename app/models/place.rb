class Place < OpenStruct
  def self.rendered_fields
    [:id, :status, :street, :city, :zip, :country, :overall ]
  end
  def self.render_city
    Place.city
  end
  def self.get_id
    [:id]
  end
  def self.render_contacts
    [:name, :street, :city, :zip, :country]
  end
end