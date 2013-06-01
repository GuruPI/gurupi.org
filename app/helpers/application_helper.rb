# encoding: UTF-8
module ApplicationHelper
  def user_role(user)
    pattern = %{<span class="user_role %s">%s</span>}
    type = (user.admin? ? ["admin", "Admin"] : (user.member? ? ["member", "Membro"] : ["guest", "Visitante"]))
    (pattern % type).html_safe
  end

  def markdown(text)
    RDiscount.new(text).to_html.html_safe
  end

  def page_title
    t page_title_translation_key
  end

  def page_title_translation_key
    :"title.#{controller_name}.#{action_name}"
  end

end
