# frozen_string_literal: true

# encoding: utf-8
require File.expand_path('../lib/json2form/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name = 'json2form'
  spec.version = Json2form::VERSION
  spec.authors = ['Jonathan Tapia']
  spec.email = ['jtapia.dev@gmail.com']
  spec.homepage = 'https://github.com/jtapia/json2form'
  spec.summary = 'Converts JSON to HTML forms'
  spec.description = 'This gem provides functionality to convert a JSON object into HTML
  form. It can handle nested JSONs. Form class, styles and
  attributes can be provided.'
  spec.license = 'MIT'

  spec.files = ['lib/json2form.rb', 'bin/json2form']

  spec.add_dependency 'html2haml'
  spec.add_dependency 'haml2slim'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'nokogiri', '>= 1.6.0'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rails-i18n'

  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'pry-rails'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'rspec-expectations'
  spec.add_development_dependency 'rspec_junit_formatter'
end
