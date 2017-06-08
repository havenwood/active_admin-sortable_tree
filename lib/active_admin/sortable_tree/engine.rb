module ActiveAdmin
  module SortableTree
    class Engine < ::Rails::Engine
      engine_name 'active_admin-sortable_tree'


      def jquery_ui_six?
        Gem::Version.new(Jquery::Ui::Rails::VERSION) >= Gem::Version.new("6.0.0")
      end

      def sortable_js
        if jquery_ui_six?
          "active_admin/sortable.js"
        else
          "active_admin/sortable_ui5.js"
        end
      end

      initializer "Rails precompile hook", group: :all do |app|
        app.config.assets.precompile += [ "active_admin/sortable.css",
                                          sortable_js ]
      end

      initializer "add assets" do
        ActiveAdmin.application.register_stylesheet "active_admin/sortable.css"
        ActiveAdmin.application.register_javascript sortable_js
      end
    end
  end
end
