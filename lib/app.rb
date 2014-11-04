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
    register Sinatra::Reloader
    set :database, Sequel.sqlite('development.db')
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
    @what = What.all
    erb :what
  end

  get '/when' do
    @when  = settings.database[:pages].filter(:page => 'when').first
    @hours = settings.database[:hours].to_a
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

  get '/admin/telephone' do
    erb :admin_telephone,   :layout => :admin_layout
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
