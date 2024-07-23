# Json2form

## Introduction

`json2form` is a ruby library and executable to convert valid JSON objects to
HTML forms. `json2form` is also available as a rubygem for quick installation.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "json2form"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install json2form
```

# Usage

## As a standalone program

If you've installed the gem, `json2form` is available as a cli command, which can be used as following:

```
$ cat some.json | json2form # outputs table
```

## In your ruby code as library

Refer to the `example/example.rb` file for sample implementation

```ruby
require 'json2form'

form_options = { convert_to: :haml } # options: [:haml, :html, :slim]
json = STDIN.read
json2form = Json2form.get_html_form(json, form_options)

puts json2form
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

