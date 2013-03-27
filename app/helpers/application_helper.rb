# encoding: UTF-8
module ApplicationHelper
  def page_title
    default = "GuruPI - Grupo de Usuários de Ruby do Piauí"
    title = @title.blank? ? default : "#{@title} - #{default}"
    title
  end

  def analytics_code(params = {})
    code = %{
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-39555893-1', 'gurupi.org');
  ga('send', 'pageview');
</script>}
    code.html_safe
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
