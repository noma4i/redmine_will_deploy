module WillDeploy
  class Hooks < Redmine::Hook::ViewListener
    def view_issues_show_description_bottom(context)
      controller = context[:controller]

      controller.render_to_string({:partial => 'hooks/will_deploy/view_issues_show_description_bottom', :locals => context})
    end

    def view_layouts_base_html_head(context)
      stylesheet_link_tag('will_deploy.css', :plugin => 'will_deploy')
    end
  end
end
