require 'sinatra'
require 'sinatra/sequel'

migration "create all the tables" do
  database.drop_table? :pages

  database.create_table :pages do
    primary_key :id
    String      :page,      :size => 31
    String      :headline,  :size => 1023, :default => ''
    String      :giant,     :size => 1023, :default => ''
    String      :bodytext,  :size => 1023, :default => ''
    String      :note,      :size => 1023, :default => ''

  end

  pages = database.from(:pages)
  pages.insert(page: 'phone',
               headline: 'For a good time:',
               giant: '303-623-3523')

  pages.insert(page: 'when',
               headline: "every friggin/' day of the week...",
               bodytext: '<ul><li>Monday: 10am - 2am</li>
                          <li>Tuesday: 10am - 2am</li>
                          <li>Wednesday: 10am - 2am</li>
                          <li>Thursday: 10am - 3am <span class="red">*</span></li>
                          <li>Friday: 10am - 3am <span class="red">*</span></li>
                          <li>Saturday: 10am - 3am <span class="red">*</span></li>
                          <li>Sunday: 10am - 2am</li></ul>',
               note: 'or as late as it takes the crowd to thin...')

  pages.insert(page: 'where',
               headline: '1626 Market Street, Denver, CO 80202')

  pages.insert(page: 'who',
               headline: 'Mario Guccio',
               bodytext: %Q{
                 An old Italian circus strong-man and fancy-pants entomologist now retired and living part time in Ireland with his bride.

                 <p>Last we heard, he makes potato cannons by day,
                 and sweet sweet love by night...</p>

                 <p>Probably not a lot to do in Ireland, really.</p>

                 <p>Oh ya, you wanna meet his <a href="http://www.doubledaughters.com/Marios_Double_Daughters_Salotto/Splash.html" alt="Double Daughters Salotto" target="_new">daughters?</a></p>
                 })

  pages.insert(page: 'why',
               headline: 'because. <br />pizza, beer &amp; rock n’ roll.',
               note: 'what else is there really?')
end
