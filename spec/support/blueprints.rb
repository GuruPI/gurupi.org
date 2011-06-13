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

