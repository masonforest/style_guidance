# Style Guidance

Style Guidance will apply styles to your rails app

## Installation

Add this line to your application's Gemfile:

    gem 'style_guidance'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install style_guidance

## Usage

To run correct all style sets run

    $ rake style

To run correct a specific style set run

    $ rake style:quotes

## TODO

Eventually Syle Guidance should use [Ripper](:http://www.ruby-doc.org/stdlib-1.9.3/libdoc/ripper/rdoc/Ripper.html) to parse you code, make sugestions, and then write it back to ruby with [Sourcerer](:https://github.com/jimweirich/sorcerer).

Possible style sets to be added:

  * Whitespace - Use 2 spaces for indentation. Don't use tabs.
  * Newlines - Do not use an empty line at the beginning or end of methods, blocks or conditionals.
  * Parenthesis - Do not include parenthesis in method definitions that don't take arguments
  * Hashes - Use ruby 1.9 hash syntax
  * Ternaries - Ternaries are harder to read than an if/else. Use an if/else.
  * ClassMethods - Define class methods using def self.method rather than class << self blocks
  * Constants - Constants are all uppercase


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
