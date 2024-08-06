# frozen_string_literal: true
# encoding: utf-8

Dir["#{File.dirname(__FILE__)}/fixtures/*.rb"].each {|file| require file }
require "#{File.dirname(__FILE__)}/../lib/json2form"

require 'pry'
require 'json'

describe Json2form do
  let(:data) do
    File.read(File.join('spec/fixtures', 'test.json'))
  end
  let(:options) { {} }

  subject { Json2form.get_html_form(data, options) }
  
  context 'with JSON data' do
    context 'with attributes key node' do
      let(:data) do
        JSON.parse(
          File.read(File.join('spec/fixtures', 'test.json'))
        )
      end

      context 'as HTML output format' do
        it 'returns the converted form' do
          form_converted = subject

          expect(form_converted).to include('<form')
          expect(form_converted).to include('<input')
          expect(form_converted).to include('<a')
          expect(form_converted).to include('<button')
        end
      end

      context 'as HAML output format' do
        let(:options) { { convert_to: :haml } }

        it 'returns the converted form' do
          form_converted = subject

          expect(form_converted).to include('%form')
          expect(form_converted).to include('%input')
          expect(form_converted).to include('%a')
          expect(form_converted).to include('%button')
        end
      end

      context 'as SLIM output format' do
        let(:options) { { convert_to: :slim } }

        it 'returns the converted form' do
          form_converted = subject

          expect(form_converted).to include('form')
          expect(form_converted).to include('input')
          expect(form_converted).to include('a')
          expect(form_converted).to include('button')
        end
      end
    end

    context 'with sections key node' do
      let(:data) do
        JSON.parse(
          File.read(File.join('spec/fixtures', 'test_sections.json'))
        )
      end

      context 'as HTML output format' do
        it 'returns the converted form' do
          form_converted = subject

          expect(form_converted).to include('<form')
          expect(form_converted).to include('<h2')
          expect(form_converted).to include('<input')
          expect(form_converted).to include('<a')
          expect(form_converted).to include('<button')
        end
      end

      context 'as HAML output format' do
        let(:options) { { convert_to: :haml } }

        it 'returns the converted form' do
          form_converted = subject

          expect(form_converted).to include('%form')
          expect(form_converted).to include('%h2')
          expect(form_converted).to include('%input')
          expect(form_converted).to include('%a')
          expect(form_converted).to include('%button')
        end
      end

      context 'as SLIM output format' do
        let(:options) { { convert_to: :slim } }

        it 'returns the converted form' do
          form_converted = subject

          expect(form_converted).to include('form')
          expect(form_converted).to include('h2')
          expect(form_converted).to include('input')
          expect(form_converted).to include('a')
          expect(form_converted).to include('button')
        end
      end
    end
  end
end
