require "mfinante/version"
require "watir"
module Mfinante
  def interogare(cui)
    browser = Watir::Browser.new :chrome, headless: true
    browser.visibility = false
    browser.goto 'http://www.mfinante.ro/infocodfiscal.html'
    browser.text_field(name: 'cod').set cui
    browser.button(type: 'submit').click
    if browser.ol.exist? 
       result = false
     else
       {
        name: browser.div(id: 'main').table.row[1].text,
        address: browser.div(id: 'main').table.td(:index => 3).text,
        county: browser.div(id: 'main').table.td(:index => 5).text,
        registration_number: browser.div(id: 'main').table.td(:index => 7).text,
        auth_document: browser.div(id: 'main').table.td(:index => 9).text,
        postal_code: browser.div(id: 'main').table.td(:index => 11).text
        phone: browser.div(id: 'main').table.td(:index => 13).text,
        fax: browser.div(id: 'main').table.td(:index => 15).text,
        company_state: browser.div(id: 'main').table.td(:index => 17).text,
        company_observation: browser.div(id: 'main').table.td(:index => 19).text,
        latest_declaration_date: browser.div(id: 'main').table.td(:index => 21).text,
        last_processing_date: browser.div(id: 'main').table.td(:index => 23).text,
        date_start_profit_tax: browser.div(id: 'main').table.td(:index => 25).text,
        micro_date_tax: browser.div(id: 'main').table.td(:index => 27).text,
        eccize_date: browser.div(id: 'main').table.td(:index => 29).text,
        tva_date: browser.div(id: 'main').table.td(:index => 31).text,
        social_contribution_date: browser.div(id: 'main').table.td(:index => 33).text,
        insurance_contribution_date: browser.div(id: 'main').table.td(:index => 35).text,
        unemployment_contribution_date: browser.div(id: 'main').table.td(:index => 37).text,
        guarantee_fund_contribution_date: browser.div(id: 'main').table.td(:index => 39).text,
        health_fund_contribution_date: browser.div(id: 'main').table.td(:index => 41).text,
        holiday_contribution_date: browser.div(id: 'main').table.td(:index => 43).text,
        gaming_text_date: browser.div(id: 'main').table.td(:index => 45).text,
        salary_tax_date: browser.div(id: 'main').table.td(:index => 47).text,
        construction_tax_date: browser.div(id: 'main').table.td(:index => 49).text,
        oil_and_gas_internal_production_date: browser.div(id: 'main').table.td(:index => 51).text,
        mining_royalities_date: browser.div(id: 'main').table.td(:index => 53).text,
        oil_royalities_date: browser.div(id: 'main').table.td(:index => 53).text,
       }
     end
  end

  def ani_bilant(cui)
    browser = Watir::Browser.new :chrome, headless: true
    browser.visibility = false
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
    browser.visibility = false
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