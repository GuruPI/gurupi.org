module UserRoles
  def role_symbols
    (roles || []).map { |r| r.title.to_sym }
  end

  def admin?
    role_symbols.include?(:admin)
  end

  def member?
    !admin? && role_symbols.include?(:member)
  end

  def guest?
    !admin? && !member?
  end

  def role
    @role = if admin?
      "admin"
    elsif member?
      "member"
    else
      "guest"
    end
  end

  def change_role(value)
    role = Role.create(:title => value)
    self.roles = [role]
  end
end