require 'sinatra'
require 'sinatra/sequel'

migration "create the menu table" do
  database.drop_table? :menu

  database.create_table :menu do
    primary_key :id
    String      :item,      :size => 1023, :default => ''
    String      :subitem,   :size => 1023, :default => ''
    String      :price,     :size => 1023, :default => ''
    String      :subprice,  :size => 1023, :default => ''
    String      :textbox,   :size => 1023, :default => ''
  end

  menu = database.from(:menu)

end

migration "create the pages table" do
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
  pages.insert(page: 'admin')
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

menu = database.from(:menu)
menu.insert(item: 'SLICE',
             price: '2.50:',
             subitem: 'Toppings',
             subprice: '0.50'
             )
menu.insert(item: 'MEDIUM[14in]',
             price: '11.50:',
             subitem: 'Toppings',
             subprice: '1.50'
             )
menu.insert(item: 'LARGE[16in]',
             price: '13.50:',
             subitem: 'Toppings',
             subprice: '2.00'
             )
menu.insert(item: 'RABBIT FOOD',
             price: '13.50:',
             subitem: 'Toppings',
             subprice: '2.00'
             )
menu.insert(textbox: "Supreme Leader Special<br />[L, Sl Only] Market Price"
             )
menu.insert(textbox: "pepperoni<br />
                      meatballs<br />
                      italian sausage<br />
                      anchovies<br />
                      canadian ham<br />
                      bacon<br />
                      <br />
                      onions<br />
                      mushrooms<br />
                      green peppers<br />
                      green olives<br />
                      black olives<br />
                      spinach<br />
                      tomatoes<br />
                      jalapenos<br />
                      pineapple<br />
                      transylvanian garlic<br />
                      ricotta<br />
                      extra cheese<br />
                      <br />
                      ranch dressing<br />
                      creamy italian<br />"
             )
menu.insert(item: "MARIO/'S SPECIAL",
             price: '[Sl] 3.50 [M] 17.00 [L] 19.00',
             textbox: 'Pepperoni, Italian Sausage, Meatballs, Green Peppers, Onions, Mushrooms, Black & Green Olives, Extra Cheese.'
             )
menu.insert(item: "GRANDAD GUCCIO/'S VEGETARIAN SPECIAL",
             price: '[Sl] 3.25 [M] 16.00 [L] 18.00',
             textbox: 'Green Peppers, Onions, Black & Green Olives, Mushrooms, Transylvanian Fresh Garlic, Extra Cheese.'
             )
menu.insert(item: "SHROOM N/' SPINNN",
             price: '[Sl] 3.25 [M] 16.00 [L] 18.00',
             textbox: 'Mushrooms, Spinach, Transylvanian Fresh Garlic, Extra Cheese.'
             )
menu.insert(item: "WHITE PIZZA",
             price: '[M] 15.00 [L] 17.00',
             textbox: 'Mozzarella, Ricotta, Transylvanian Fresh Garlic, Oregano, Black Pepper.'
             )
menu.insert(item: "RABBIT FOOD",
             price: '[Bowl] 4.00 ',
             textbox: 'Romaine, Iceberg, Green Peppers, Black and Green Olives, Onions, Mushrooms, Cheese, Tomatoes.'
             )

end
