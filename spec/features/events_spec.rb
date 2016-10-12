# encoding: utf-8
require 'spec_helper'

describe 'Events' do
  describe 'GET /index' do
    before(:each) do
      Event.make!(:gurupi5)
      Event.make!(:interaje)
    end

    it "should display all events" do
      visit '/events'
      page.should have_content '5 Encontro oficial do gurupi'
      page.should have_content '14:00'
      page.should have_content I18n.l(Date.today + 7.days)
      page.should have_content 'UESPI - Universidade Estadual do Piauí'

      page.should have_content 'Interaje especial com o Fábio Akita'
      page.should have_content '19:00'
      page.should have_content I18n.l(Date.today - 7.days)
      page.should have_content 'UFPI - Universidade Federal do Piauí'
    end
  end
end
