# Require core library
require "middleman-core"
require "redcarpet"

# Extension namespace
class I18nMarkdown < ::Middleman::Extension
  option :my_option, "default", "An example option"

  module I18n::Backend
   module Markdown
     def markdown
       options = { link_attributes: { target: "_blank" } }
       @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(options))
     end

     def translate(locale, key, options = {})
       options[:markdown] ? process(super) : super
     end

     def process(entry)
       markdown.render(entry)
     end
   end
  end

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    I18n::Backend::Simple.send(:include, I18n::Backend::Markdown)
  end

  def after_configuration; end
end

I18nMarkdown.register(:i18n_markdown)
