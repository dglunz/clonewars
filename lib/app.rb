class TwoFistedApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? &&
    @auth.credentials && @auth.credentials == ['admin', 'admin']
  end

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  def authenticate!(user_type)
    return true if who_is_allowed?(user_type)
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n" and return false;
  end

  #default pword is password ;-)
  def who_is_allowed?(type_of_user, password="password")
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? &&
    @auth.credentials && @auth.credentials == [type_of_user, password]
  end

  get '/' do
    erb :home
  end

  get '/phone' do
    @phone = Phone.all
    erb :phone
  end

  get '/what' do
    @what = What.all
    erb :what
  end

  get '/when' do
    @when = When.all
    erb :when
  end

  get '/where' do
    @where = Where.all
    erb :where
  end

  get '/why' do
    @why = Why.all
    erb :why
  end

  get '/who' do
    @who = Who.all
    erb :who
  end

  # admin paths
  get '/admin/:path' do
    pass unless authenticate!("admin")
  end

  get '/admin' do
    protected!
    erb :admin_index,       :layout => :admin_layout
  end

  get '/admin/phone' do
    erb :admin_phone,   :layout => :admin_layout
  end

  get '/admin/what' do
    erb :admin_what,        :layout => :admin_layout
  end

  get '/admin/when' do
    erb :admin_when,        :layout => :admin_layout
  end

  get '/admin/where' do
    erb :admin_where,       :layout => :admin_layout
  end

  get '/admin/why' do
    erb :admin_why,         :layout => :admin_layout
  end

  get '/admin/who' do
    erb :admin_who,         :layout => :admin_layout
  end
end
