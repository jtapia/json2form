# frozen_string_literal: true

require 'html2haml'
require 'haml2slim'

module Json2form
  module Utils
    class Converter
      class << self
        def convert(html, format)
          case format
          when :haml
            to_haml(html)
          when :slim
            to_slim(html)
          else
            html
          end
        end

        def to_haml(html)
          Html2haml::HTML.new(html).render
        end

        def to_html(html)
          html
        end

        def to_slim(html)
          Haml2Slim.convert!(to_haml(html)).to_s
        end
      end
    end
  end
end
