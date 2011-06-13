authorization do
  role :guest do
    has_permission_on [:users], :to => [:index]
    has_permission_on [:users], :to => [:read] do
      if_attribute :roles => { :title => is { "admin" } }
      if_attribute :roles => { :title => is { "member" } }
    end
  end

  role :member do
    has_permission_on [:users], :to => [:index, :read]
  end

  role :admin do
    includes :member
    has_permission_on [:users], :to => [:index, :edit, :update, :change]
  end
end
