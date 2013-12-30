class Tauthorization
  include Mongoid::Document
  field :tprovider, type: String
  field :uid, type: String
  field :user_id, type: Integer


belongs_to :gpost
validates :tprovider, :uid, :presence => true

def self.find_or_create(auth_hash)
  unless auth = find_by(tprovider: auth_hash["tprovider"],uid: auth_hash["uid"])
   gpost = Gpost.create :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
    auth = create :gpost => gpost, :tprovider => auth_hash["tprovider"], :uid => auth_hash["uid"]
  end
 
  auth
end
end
