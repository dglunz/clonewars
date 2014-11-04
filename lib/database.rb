require 'sinatra'
require 'sinatra/sequel'

migration "create the pages table" do
  database.create_table :pages do
    primary_key :id
    String      :page,    :size => 31
    String      :header,  :size => 255
    String      :content, :size => 255, :default => ''
  end

  database.create_table :hours do
    primary_key :id
    String      :day,   :size => 31
    String      :open,  :size => 7, :default => '10am'
    String      :close, :size => 7, :default => '2am'
  end

  pages = database.from(:pages)
  pages.insert(page: 'phone',
               header: 'For a good time:',
               content: '303-623-3523')

  pages.insert(page: 'when',
               header: "every friggin' day of the week...")

  hours = database.from(:hours)
  week = ['monday','tuesday','wednesday','thursday','friday','saturday','sunday']
  week.each{ |day| hours.insert(day: "#{day}") }
  weekend = ['thursday', 'friday', 'saturday']
  weekend.each{ |day| hours.where(:day => day).update(close: '3am')}

  pages.insert(page: 'where',
               header: '1626 Market Street, Denver, CO 80202')

  pages.insert(page: 'who',
               header: 'Mario Guccio',
               content: %Q{
                 An old Italian circus strong-man and fancy-pants entomologist now retired and living part time in Ireland with his bride.

                 <p>Last we heard, he makes potato cannons by day,
                 and sweet sweet love by night...</p>

                 <p>Probably not a lot to do in Ireland, really.</p>

                 <p>Oh ya, you wanna meet his <a href="http://www.doubledaughters.com/Marios_Double_Daughters_Salotto/Splash.html" alt="Double Daughters Salotto" target="_new">daughters?</a></p>
                 })

  pages.insert(page: 'why',
               header: 'because.<h1>pizza, beer &amp; rock n’ roll.</h1>',
               content: 'what else is there really?')                 
end
