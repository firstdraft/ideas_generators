# frozen_string_literal: true

require "rails/generators/named_base"

module Ideas
  class ResourceFormGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("../templates", __FILE__)

    argument :attributes, type: :array, default: [], banner: "field:type field:type"

    class_option :new_form_name, type: :string, default: "", desc: "Partial name"
    class_option :associated_table_name, type: :string, default: "", desc: "Associatiated table name"

    def create_root_folder
      empty_directory view_template_path
    end

    def generate_view_files
      template "association_new_form.html.erb",
               File.join(view_template_path, options.new_form_name)
    end

    private

    def view_template_path
      File.join("app/views", plural_table_name)
    end

    def new_form_hidden_variable
      "@#{options[:associated_table_name].singularize}.id"
    end
  end
end
