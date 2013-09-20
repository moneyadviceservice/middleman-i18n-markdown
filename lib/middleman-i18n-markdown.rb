# Require core library
require "middleman-core"

# Extension namespace
class I18nMarkdown < ::Middleman::Extension
  option :my_option, "default", "An example option"

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    module I18n::Backend
     module Markdown
       def markdown
         options = { link_attributes: { target: "_blank" } }
         @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(options))
       end

       def translate(locale, key, options = {})
         puts super.inspect
         options[:markdown] ? process(super) : super
         process(super)
       end

       def process(entry)
         markdown.render(entry)
       end
     end
    end

    I18n::Backend::Simple.send(:include, I18n::Backend::Markdown)

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
  end

  def after_configuration
    # Do something
  end

  # A Sitemap Manipulator
  # def manipulate_resource_list(resources)
  # end

  # module do
  #   def a_helper
  #   end
  # end

end

# Register extensions which can be activated
# Make sure we have the version of Middleman we expect
# Name param may be omited, it will default to underscored
# version of class name

# MyExtension.register(:my_extension)
