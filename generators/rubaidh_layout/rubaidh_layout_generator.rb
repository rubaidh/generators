require File.join(File.dirname(__FILE__), '..', 'rubaidh_named_base')

class RubaidhLayoutGenerator < RubaidhNamedBase
  def manifest
    record do |m|
      # Check the layout dir and stylesheets dir exist
      m.directory File.join('app/views/layouts')
      m.directory File.join('public/stylesheets')

      # copy layout over to app
      m.template 'layout.html.erb',
                  File.join('app/views/layouts', "application.html.erb")

      # copy CSS files
      m.template 'base.css',
                  File.join('public/stylesheets', "base.css")
      m.template 'style.css',
                  File.join('public/stylesheets', "style.css")

    end
  end
end