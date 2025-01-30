#!/usr/bin/env ruby
# frozen_string_literal: true

require 'yaml'
require 'slim'

menu = YAML.load_file('drinks.yaml')

template_path = File.join(__dir__, 'templates', 'index.slim')
template_content = File.read(template_path)
slim_template = Slim::Template.new { template_content }

html_result = slim_template.render(Object.new, menu: menu)

File.open('index.html', 'w') do |file|
  file.write(html_result)
end

puts "Статический файл index.html сгенерирован!"
