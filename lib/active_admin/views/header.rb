module ActiveAdmin
  module Views
    class Header < Component

      def build(namespace, menu)
        super(:id => "header")

        @namespace = namespace
        @menu = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)

        div :class => "navbar-inner" do
          div :class => "container-fluid" do
            build_site_title
            build_utility_navigation
            build_global_navigation
          end
        end
      end

      def build_site_title
        insert_tag view_factory.site_title, @namespace
      end

      def build_global_navigation
        insert_tag view_factory.global_navigation, @menu, :class => 'nav header-item'
      end

      def build_utility_navigation
        insert_tag view_factory.global_navigation, @utility_menu, :id => "utility_nav", :class => 'nav header-item pull-right' 
      end

      def default_class_name
        "navbar navbar-inverse navbar-fixed-top"
      end

    end
  end
end
