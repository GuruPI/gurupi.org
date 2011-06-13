# encoding: UTF-8
module ApplicationHelper
  def user_role(user)
    pattern = %{<span class="user_role %s">%s</span>}
    type = (user.admin? ? ["admin", "Admin"] : (user.member? ? ["member", "Membro"] : ["guest", "Visitante"]))
    (pattern % type).html_safe
  end
end
