class TwoFistedApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    erb :error
  end

  get '/' do
    erb :home
  end

  get '/phone' do
    erb :phone
  end

  get '/what' do
    erb :what
  end

  get '/when' do
    erb :when
  end

  get '/where' do
    erb :where
  end

  get '/why' do
    erb :why
  end

  get '/who' do
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
