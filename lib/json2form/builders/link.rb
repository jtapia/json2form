# frozen_string_literal: true

module Json2form
  module Builders
    class Link < Base
      def create
        if data['type'].in?(%w[submit button])
          "<button type='#{data['type']}'
            id='#{data['id']}'
            name='#{data['name']}'
            class='#{data['class']}'
            style='#{data['style']}'
            rel='#{data['rel']}'
            #{parser_class.data_attributes(data['data'] || {})} >
             #{data['value']}
           </button><br />"
        else
          "<a href='#{data['url']}'
              id='#{data['id']}'
              name='#{data['name']}'
              class='#{data['class']}'
              style='#{data['style']}'
              rel='#{data['rel']}'
              #{parser_class.data_attributes(data['data'] || {})} >
             #{data['value']}
           </a><br />"
        end
      end
    end
  end
end
