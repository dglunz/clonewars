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
    set :database, Sequel.sqlite('development.db')
  end

  configure :production do
    # figure out pg
    # set :database, Sequel.postgres('production.db')
  end

  not_found do
    erb :error
  end

  get '/' do
    @home = settings.database[:pages].filter(:page => 'home').first
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
    protected!
    erb :admin_index,       :layout => :admin_layout
  end

  get '/admin/phone' do
    erb :admin_phone,       :layout => :admin_layout
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
