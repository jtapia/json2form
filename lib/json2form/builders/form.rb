# frozen_string_literal: true

# require 'json'

module Json2form
  module Builders
    class Form < Base
      def create
        html = ''

        html += build_form_tag(form_attributes.merge(options))
        html += build_form_content(form_content, options)
        html += build_form_links(form_links, options)
        html += build_form_close_tag

        html
      end

      private

      def build_form_tag(options)
        "<form url='#{options['url']}'
               id='#{options['id']}'
               name='#{options['name']}'
               action='#{options['action']}'
               class='#{options['form_class']}'
               style='#{options['form_style']}'
               #{parser_class.data_attributes(options['data'] || {})} >\n"
      end

      def build_form_content(attributes, options)
        html = ''

        div = if form_attributes_container['type'] == 'div'
          div_builder_class.new(
            form_attributes_container,
            options
          ).create
        end

        container = if div.present? ? div : html
        container = Nokogiri::HTML5.fragment(container)
        container_html = container.xpath('div').first

        form_attributes_elements.each do |attribute|
          if attribute['label'].present?
            container_html.inner_html +=
              input_builder_class.new(
                attribute['label'],
                options
              ).create
          end

          container_html.inner_html +=
            input_builder_class.new(
              attribute,
              options
            ).create
        end

        html += container_html.to_s

        html
      end

      def build_form_links(attributes, options)
        html = ''

        div = if form_links_container['type'] == 'div'
          div_builder_class.new(
            form_links_container,
            options
          ).create
        end

        container = if div.present? ? div : html
        container = Nokogiri::HTML5.fragment(container)
        container_html = container.xpath('div').first

        form_links_elements.each do |attribute|
          container_html.inner_html +=
            link_builder_class.new(
              attribute,
              options
            ).create
        end

        html += container_html.to_s

        html
      end

      def build_form_close_tag
        '</form><br />'
      end

      # def create_form_input(attribute, options)
      #   Json2form::Utils.build_form_input(attribute, options)
      #   # case attribute[:type]
      #   # when 'string'
      #   #   build_text_input(attribute)
      #   # when 'text'
      #   #   build_textarea_input(attribute)
      #   # when 'email'
      #   #   build_email_input(attribute)
      #   # when 'password'
      #   #   build_password_input(attribute)
      #   # when 'select'
      #   #   build_select_input(attribute)
      #   # when 'radio'
      #   #   build_radio_input(attribute)
      #   # else
      #   #   raise StandardError, 'Unknown attribute type'
      #   # end
      # end
    end
  end
end
