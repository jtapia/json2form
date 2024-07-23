# frozen_string_literal: true

module Json2form
  module Utils
    class Parser
      class << self
        def json_parse(json_str)
          json_parsed = json_str if json_str.is_a?(Hash)
          json_parsed = JSON.parse(json_str) if hash.blank?
          json_parsed
        end

        def data_attributes(data = {})
          data_attributes = []

          data.each do |key, value|
            data_attributes << "data-#{key.to_s.tr('_', '-')}='#{value}'"
          end

          data_attributes.join(' ')
        end
      end
    end
  end
end
