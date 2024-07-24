# frozen_string_literal: true

require 'rails'
require 'nokogiri'
require 'json2form/version'
require 'json2form/engine'

require 'json2form/builders/base'
require 'json2form/builders/form'
require 'json2form/builders/input'
require 'json2form/builders/link'
require 'json2form/builders/label'
require 'json2form/builders/div'

require 'json2form/utils/converter'
require 'json2form/utils/parser'

module Json2form
  class << self
    def get_html_form(data = {}, options = {})
      html = ''

      parsed_json = Json2form::Utils::Parser.json_parse(data)
      form_builder = Json2form::Builders::Form.new(
        parsed_json,
        options
      )
      html = form_builder.create

      Json2form::Utils::Converter.convert(
        html,
        options[:convert_to] || :html
      )
    rescue => e
      puts 'JSON2FORM:: Input not a valid JSON, provide valid JSON object'
      throw e
    end
  end
end
