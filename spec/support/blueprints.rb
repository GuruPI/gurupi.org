# encoding: utf-8
require 'machinist/active_record'

User.blueprint do
  name  { "Name #{sn}" }
  email { "email#{sn}@example.com" }
end

Role.blueprint do
  title { "guest" }
end

Role.blueprint(:member) do
  title { "member" }
end

Role.blueprint(:admin) do
  title { "admin" }
end

Post.blueprint do
  title {'My awesome title'}
  body {'My awesome body'}
  user {User.make!}
end

Event.blueprint(:gurupi5) do
  name { '5 Encontro oficial do gurupi' }
  description { 'Um encontro para falarmos sobre as novidades do mundo Ruby, Site Oficial, Dojos, Horaextras, Rubyconf Brasil 2011, próximos encontros e muito mais.' }
  event_date { Date.today + 7.days }
  hour { '14:00' }
  place { 'UESPI - Universidade Estadual do Piauí' }
  enable_lectures { true }
end

Event.blueprint(:interaje) do
  name { 'Interaje especial com o Fábio Akita' }
  description { 'No dia 13 de Setembro vai ter um interaje com o Fábio Akita, o evangelista Ruby e Ruby On Rails do Brasil!' }
  event_date { Date.today - 7.days }
  hour { '19:00' }
  place { 'UFPI - Universidade Federal do Piauí' }
  enable_lectures { false }
end
