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
    @phone_header = "For a good time:"
    @phone = "303-623-3523"
    erb :phone
  end

  get '/what' do
    @menu = 'coming soon'
    erb :what
  end

  get '/when' do
    @schedule = {
      'monday' => '10am - 2am',
      'tuesday' => '10am - 2am',
      'wednesday' => '10am - 2am',
      'thursday' => '10am - 3am',
      'friday' => '10am - 3am',
      'saturday' => '10am - 3am',
      'sunday' => '10am - 2am',
    }
    erb :when
  end

  get '/where' do
    @address = '1626 Market Street, Denver, CO 80202'
    erb :where
  end

  get '/why' do
    @why_header = '
    because.

    <h1>pizza, beer &amp; rock n’ roll.</h1>
    '
    @why_note = 'what else is there really?'
    erb :why
  end

  get '/who' do
    @who_header = 'Mario Guccio'
    @who_description = '

    An old Italian circus strong-man and fancy-pants entomologist now retired and living part time in Ireland with his bride.

    <p>Last we heard, he makes potato cannons by day,
    and sweet sweet love by night...</p>

    <p>Probably not a lot to do in Ireland, really.</p>

    <p>Oh ya, you wanna meet his <a href="http://www.doubledaughters.com/Marios_Double_Daughters_Salotto/Splash.html" alt="Double Daughters Salotto" target="_new">daughters?</a></p>

    '
    erb :who
  end
end
