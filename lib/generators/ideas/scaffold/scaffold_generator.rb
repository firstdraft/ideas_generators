# frozen_string_literal: true

require "rails/generators/rails/scaffold/scaffold_generator"
require_relative "scaffold_controller_generator"

module Ideas
  class ScaffoldGenerator < ::Rails::Generators::ScaffoldGenerator

    remove_hook_for :scaffold_controller
    remove_hook_for :assets

    def generate_controller
      invoke ScaffoldControllerGenerator
    end
  end
end
