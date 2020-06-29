# frozen_string_literal: true

require "rails/generators/erb/scaffold/scaffold_generator"

module Ideas
  class ScaffoldErbGenerator < Erb::Generators::ScaffoldGenerator
    source_root File.expand_path("../templates", __FILE__)

    def copy_view_files
      available_views.each do |view|
        template view, File.join("app/views", controller_file_path, view)
      end
    end

    def add_helpers
      return if File.read("app/helpers/application_helper.rb").scan(/def\s*link_to_show_or_back/).present?
      inject_into_file "app/helpers/application_helper.rb", after: /module\s*ApplicationHelper/ do
<<-CODE

  def link_to_show_or_back(
        object,
        show_content = "Show",
        back_content = "Back",
        options = {}
      )
    if request.path == url_for(object)
      link_to back_content, :back, options
    else
      link_to show_content, object, options
    end
  end
CODE
      end
    end

    private

    def available_views
      base = self.class.source_root
      base_len = base.length + 1
      Dir[File.join(base, "*.erb")].
        select { |f| File.file?(f) }.
        map { |f| f[base_len..-1] }
    end
  end
end
