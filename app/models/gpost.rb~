class Gpost
  include Mongoid::Document
  field :name, type: String
  field :email, type: String



has_many :authorizations
validates :name, :email, :presence => true

def add_provider(auth_hash)
  # Check if the provider already exists, so we don't add it twice
  unless authorizations.find_by(provider: auth_hash["provider"],uid: auth_hash["uid"])
    Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end

unless tauthorizations.find_by(provider: auth_hash["tprovider"],uid: auth_hash["uid"])
    Tauthorization.create :user => self, :tprovider => auth_hash["tprovider"], :uid => auth_hash["uid"]
  end

unless fauthorizations.find_by(provider: auth_hash["fprovider"],uid: auth_hash["uid"])
    Fauthorization.create :user => self, :fprovider => auth_hash["fprovider"], :uid => auth_hash["uid"]
  end

end

end
