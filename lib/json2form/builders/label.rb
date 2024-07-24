# frozen_string_literal: true

module Json2form
  module Builders
    class Label < Base
      def create
        "<label for='#{data['for']}'
                id='#{data['id']}'
                name='#{data['name']}'
                class='#{data['class']}'
                style='#{data['style']}'
                #{parser_class.data_attributes(data['data'] || {})} >
           #{data['value']}
        </label>"
      end
    end
  end
end
