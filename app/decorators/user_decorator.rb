class UserDecorator < Draper::Decorator
    delegate_all

    def link
        link_name = model.provider == 'facebook' ? 'Facebook' : 'GitHub'
        h.link_to_if model.link.present?, link_name, model.link, :class => "facebook"
    end
end
