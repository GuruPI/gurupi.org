# encoding: utf-8
require 'spec_helper'

describe 'Events' do
  describe 'GET /index' do
    it "should display all events" do
      Event.make!(:gurupi5)
      Event.make!(:interaje)

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

    it "should create one" do
      visit root_path

      click_on 'Conectar com Github'

      User.last.roles << Role.create(title: 'admin')

      within '#menu' do
        click_on 'Agenda'
      end

      click_on 'Criar um novo evento'

      fill_in 'Nome', with: 'Gurupi #1'
      fill_in 'Descrição', with: 'Description...'
      fill_in 'Horário', with: '14:00'

      click_on 'Criar Evento'

      expect(page).to have_content 'Gurupi #1'
      expect(page).to have_content 'Description...'
      expect(page).to have_content '14:00'
    end

    it "should not create one whether user is not logged in" do
      visit root_path

      within '#menu' do
        click_on 'Agenda'
      end

      click_on 'Criar um novo evento'

      expect(page).to_not have_content 'Novo Evento'
    end

    it 'should update one' do
      Event.make!(:gurupi5)

      visit root_path

      click_on 'Conectar com Github'

      User.last.roles << Role.make!(:admin)

      within '#menu' do
        click_on 'Agenda'
      end

      within '#main' do
        expect(page).to have_content '5 Encontro oficial do gurupi'
        click_on 'Editar evento'
      end

      fill_in 'Nome', with: 'Gurupi #5'
      fill_in 'Descrição', with: 'desc edited'
      fill_in 'Horário', with: '15:00'

      click_on 'Atualizar Evento'

      expect(page).to have_content 'Gurupi #5'
      expect(page).to have_content 'desc edited'
      expect(page).to have_content '15:00'
    end
  end
end
