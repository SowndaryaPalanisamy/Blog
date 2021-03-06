class LogsController < ApplicationController
  def index
  end

def create
    auth = request.env["omniauth.auth"]
    gpost = Gpost.find_by(provider: auth["provider"],uid: auth["uid"]) || Gpost.create_with_omniauth(auth)
    log[:user_id] = gpost.id

gpost = Gpost.find_by(tprovider: auth["tprovider"],uid: auth["uid"]) || Gpost.create_with_omniauth(auth)
    redirect_to root_url, :notice => "Signed in!"


 gpost = Gpost.find_by(fprovider: auth["fprovider"], uid: auth["uid"]) || Gpost.create_with_omniauth(auth)
    log[:user_id] = gpost.id

  end

  def destroy
    log[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
