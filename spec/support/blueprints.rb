# encoding: utf-8
require 'machinist/active_record'

User.blueprint do
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

Event.blueprint do
  name            { "Event Name #{sn}" }
  description     { "Event Description #{sn}" }
  event_date      { Date.today + sn.to_i.days }
  hour            { "#{rand(24)}:00" }
  place           { "Event Place #{sn}" }
  enable_lectures { true }
end

Lecture.blueprint do
  name          { "Lecture Name #{sn}" }
  description   { "Lecture Description #{sn}" }
  user          { User.make! }
  event         { Event.make! }
  positive_vote { rand(20) }
  negative_vote { rand(10) }
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

Lecture.blueprint(:interaje) do
  name { 'Mudando o mundo com Ruby on Rails' }
  description { 'Como você pode mudar o mundo' }
  user { User.make! }
  event { Event.make!(:interaje) }
end

Identity.blueprint do
  name  { "Name #{sn}" }
  user { User.make! }
  provider { "facebook" }
  uid { "121321#{sn}31231" }
  image { "http://profile.ak.fbcdn.net/hprofile-ak-sn#{sn}/260670_1681442949_224808880_q.jpg" }
  link { "https://www.facebook.com/rogerio.medeiros.{sn}" }
end

Comment.blueprint do
  name    { "Name #{sn}" }
  body    { "Comment Body #{sn}" }
  post_id { Post.make! }
  user_id { User.make! }
end
