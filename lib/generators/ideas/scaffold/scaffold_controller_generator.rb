# frozen_string_literal: true

require "rails/generators/rails/scaffold_controller/scaffold_controller_generator"
require_relative "scaffold_erb_generator"

module Ideas
  class ScaffoldControllerGenerator < ::Rails::Generators::ScaffoldControllerGenerator
    source_root Rails::Generators::ScaffoldControllerGenerator.source_root

    remove_hook_for :template_engine

    def generate_views
      invoke Ideas::ScaffoldErbGenerator
    end
  end
end
