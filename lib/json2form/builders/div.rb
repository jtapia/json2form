# frozen_string_literal: true

module Json2form
  module Builders
    class Div < Base
      def create
        "<div id='#{data['id']}'
              class='#{data['class']}'
              style='#{data['style']}'
              #{parser_class.data_attributes(data['data'] || {})} >
        </div>"
      end
    end
  end
end
