require_relative './app/models/phone'
require_relative './app/models/what'
require_relative './app/models/when'
require_relative './app/models/where'
require_relative './app/models/why'
require_relative './app/models/who'
require_relative './database'
require 'pry'

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
    set :database, Sequel.postgres('production.db')
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
    erb :admin_index,       :layout => :admin_layout
  end

  get '/admin_phone' do
    erb :admin_phone,       :layout => :admin_layout
  end

  get '/admin_what' do
    erb :admin_what,        :layout => :admin_layout
  end

  get '/admin_when' do
    erb :admin_when,        :layout => :admin_layout
  end

  get '/admin_where' do
    erb :admin_where,       :layout => :admin_layout
  end

  get '/admin_why' do
    erb :admin_why,         :layout => :admin_layout
  end

  get '/admin_who' do
    erb :admin_who,         :layout => :admin_layout
  end

  post '/admin_phone' do
    erb :admin_phone,       :layout => :admin_layout
  end

  post '/admin_what' do
    erb :admin_what,        :layout => :admin_layout
  end

  post '/admin_when' do
    unless params[:headline] == settings.database[:pages].select(:headline).first[:headline]
      settings.database[:pages].where(:page => 'when').update(:headline => params[:headline])
      redirect '/admin_when'
    end
  end

  post '/admin_where' do
    erb :admin_where,       :layout => :admin_layout
  end

  post '/admin_why' do
    erb :admin_why,         :layout => :admin_layout
  end

  post '/admin_who' do
    erb :admin_who,         :layout => :admin_layout
  end
end
