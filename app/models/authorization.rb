class Authorization
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :user_id, type: Integer



belongs_to :gpost
validates :provider, :uid, :presence => true

def self.find_or_create(auth_hash)
  unless auth = find_by(provider: auth_hash["provider"],uid: auth_hash["uid"])
   gpost = Gpost.create :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
    auth = create :gpost => gpost, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end
 
  auth
end
end
