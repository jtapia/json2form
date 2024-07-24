# frozen_string_literal: true

module Json2form
  module Builders
    class Input < Base
      def create
        "<input type='#{data['type']}'
                id='#{data['id']}'
                name='#{data['name']}'
                placeholder='#{data['placeholder']}'
                class='#{data['class']}'
                style='#{data['style']}'
                required='#{data['required'] || false}'
                #{parser_class.data_attributes(data['data'] || {})} >"
      end
    end
  end
end
