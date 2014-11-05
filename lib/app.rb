require_relative './app/models/phone'
require_relative './app/models/what'
require_relative './app/models/when'
require_relative './app/models/where'
require_relative './app/models/why'
require_relative './app/models/who'
require_relative './database'

class TwoFistedApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    set :database, Sequel.sqlite('development.db')
  end

  configure :production do
    set :database, Sequel.connect(ENV['DATABASE_URL'])
  end

  configure :test do
    set :database, Sequel.sqlite('test.db')
  end

  not_found do
    erb :error
  end

  get '/' do
    erb :home
  end

  get '/phone' do
    @phone = settings.database[:pages].filter(:page => 'phone').first
    erb :phone
  end

  get '/what' do
    @what = settings.database[:pages].filter(:page => 'what').first
    erb :what
  end

  get '/when' do
    @when = settings.database[:pages].filter(:page => 'when').first
    erb :when
  end

  get '/where' do
    @where = settings.database[:pages].filter(:page => 'where').first
    erb :where
  end

  get '/why' do
    @why = settings.database[:pages].filter(:page => 'why').first
    erb :why
  end

  get '/who' do
    @who = settings.database[:pages].filter(:page => 'who').first
    erb :who
  end

  # admin paths

  get '/admin' do
    # @cms_path = "/admin"
    # @content  = settings.database[:pages].where(page: 'who').first
    erb :admin_index,       :layout => :admin_layout
  end

  get '/admin_phone' do
    @cms_path = "/admin_phone"
    @content  = settings.database[:pages].where(page: 'phone').first
    erb :admin_phone,       :layout => :admin_layout
  end

  get '/admin_what' do
    @cms_path = "/admin_what"
    @content  = settings.database[:pages].where(page: 'what').first
    erb :admin_what,        :layout => :admin_layout
  end

  get '/admin_when' do
    @cms_path = "/admin_when"
    @content  = settings.database[:pages].where(page: 'when').first
    erb :admin_when,        :layout => :admin_layout
  end

  get '/admin_where' do
    @cms_path = "/admin_where"
    @content  = settings.database[:pages].where(page: 'where').first
    erb :admin_where,       :layout => :admin_layout
  end

  get '/admin_why' do
    @cms_path = "/admin_why"
    @content  = settings.database[:pages].where(page: 'why').first
    erb :admin_why,         :layout => :admin_layout
  end

  get '/admin_who' do
    @cms_path = "/admin_who"
    @content  = settings.database[:pages].where(page: 'who').first
    erb :admin_who,         :layout => :admin_layout
  end

  post '/admin_phone' do
    update_database(params, "phone")
    redirect '/admin_phone'
  end

  post '/admin_what' do
    update_database(params, "what")
    redirect '/admin_what'
  end

  post '/admin_when' do
    update_database(params, "when")
    redirect '/admin_when'
  end

  post '/admin_where' do
    update_database(params, "where")
    redirect '/admin_where'
  end

  post '/admin_why' do
    update_database(params, "why")
    redirect '/admin_why'
  end

  post '/admin_who' do
    update_database(params, "who")
    redirect '/admin_when'
  end

  def update_database(params, page)
    [:headline, :giant, :bodytext, :note].each do |key|
      settings.database[:pages].where(page: page).update(key => params[key])
    end
  end

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
end
