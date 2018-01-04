require "mfinante/version"
require "watir"
module Mfinante
  def interogare(cui)
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto 'http://www.mfinante.ro/infocodfiscal.html'
    browser.text_field(name: 'cod').set cui
    browser.button(type: 'submit').click
    if browser.ol.exist? 
       result = false
     else
      h=  {
        name: browser.div(id: 'main').table.row[1].text,
        address: browser.div(id: 'main').table.td(:index => 3).text,
        county: browser.div(id: 'main').table.td(:index => 5).text,
        registration_number: browser.div(id: 'main').table.td(:index => 7).text,
        auth_document: browser.div(id: 'main').table.td(:index => 9).text,
        postal_code: browser.div(id: 'main').table.td(:index => 11).text,
        phone: browser.div(id: 'main').table.td(:index => 13).text
       }
     end
  end

  def ani_bilant(cui)
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto 'http://www.mfinante.ro/infocodfiscal.html'
    browser.text_field(name: 'cod').set cui
    browser.button(type: 'submit').click
    if browser.ol.exist? 
      result = false
    else
      x=browser.select(name: 'an').options.to_a
      a=[]
      x.each do |f|
        a << f.text 
      end
    end
  end

  def bilant(cui, an)
    browser = Watir::Browser.new :chrome, headless: true
    browser.goto 'http://www.mfinante.ro/infocodfiscal.html'
    browser.text_field(name: 'cod').set cui
    browser.button(type: 'submit').click
    if browser.ol.exist? 
      result = false
    else
      x=browser.select(name: 'an').select(an)
      browser.button(type: 'submit').click
      {
        browser.div(id: 'main').table.html
      }
    end
  end
end