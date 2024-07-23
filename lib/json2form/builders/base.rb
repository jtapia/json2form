# frozen_string_literal: true

module Json2form
  module Builders
    class Base
      attr_reader :data, :options

      def initialize(data = {}, options = {})
        @data = data
        @options = options
      end

      def form_builder_class
        @form_builder_class ||= Json2form::Builders::Form
      end

      def input_builder_class
        @input_builder_class ||= Json2form::Builders::Input
      end

      def link_builder_class
        @link_builder_class ||= Json2form::Builders::Link
      end

      def label_builder_class
        @label_builder_class ||= Json2form::Builders::Label
      end

      def parser_class
        @parser_class ||= Json2form::Utils::Parser
      end

      private

      def json_schema
        @json_schema ||= data['schema']
      end

      def form_attributes
        @form_attributes ||= json_schema.except('attributes', 'links')
      end

      def form_content
        @form_content ||= json_schema['attributes']
      end

      def form_links
        @form_links ||= json_schema['links']
      end
    end
  end
end
