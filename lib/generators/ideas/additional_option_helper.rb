# frozen_string_literal: true

require "rails/generators"

module Ideas
  module AdditionalOptionHelper
    def self.included(base)
      base.class_option :with_sentinels, type: :boolean, default: false, desc: "Skip adding comments to generated files"
    end

    def with_sentinels?
      options[:with_sentinels]
    end
  end
end

Rails::Generators::Base.include(Ideas::AdditionalOptionHelper)
