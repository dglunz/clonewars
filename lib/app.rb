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
end
