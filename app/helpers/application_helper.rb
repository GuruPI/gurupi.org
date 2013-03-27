# encoding: UTF-8
module ApplicationHelper
  def page_title
    default = "GuruPI - Grupo de Usuários de Ruby do Piauí"
    title = @title.blank? ? default : "#{@title} - #{default}"
    title
  end

  def user_role(user)
    pattern = %{<span class="user_role %s">%s</span>}
    type = (user.admin? ? ["admin", "Admin"] : (user.member? ? ["member", "Membro"] : ["guest", "Visitante"]))
    (pattern % type).html_safe
  end

  def markdown(text)
    RDiscount.new(text).to_html.html_safe
  end
end
