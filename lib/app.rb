class TwoFistedApp < Sinatra::Base
  set :method_override, true
  set :root, 'lib/app'

  set :public_folder, 'public'

  configure :development do
    register Sinatra::Reloader
  end

  not_found do
    # erb :error
  end

  get '/' do
    erb :home
  end

  get '/what' do
    erb :what
  end
end
