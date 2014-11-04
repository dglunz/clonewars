require 'sinatra'
require 'sinatra/sequel'


def self.all

end

migration "create the pages table" do
  database.create_table :pages do
    primary_key :id
    String      :page,    :size => 31
    String      :header,  :size => 255
    String      :content, :size => 255
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
               header: "every friggin' day of the week...",
               content: "")

  hours = database.from(:hours)
  week = ['monday','tuesday','wednesday','thursday','friday','saturday','sunday']
  week.each{ |day| hours.insert(day: "#{day}") }
end
