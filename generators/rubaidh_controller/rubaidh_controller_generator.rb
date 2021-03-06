require File.join(File.dirname(__FILE__), '..', 'rubaidh_named_base')

class RubaidhControllerGenerator < RubaidhNamedBase
  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions "#{class_name}Controller"

      # Controller, helper, views, and spec directories.
      m.directory File.join('app/controllers', class_path)
      m.directory File.join('app/views', class_path, file_name)
      m.directory File.join('spec/controllers', class_path)

      # Controller spec, class, and helper.
      m.template 'controller.rb',
                 File.join('app/controllers',
                           class_path,
                           "#{file_name}_controller.rb")

      m.template 'controller_spec.rb',
                 File.join('spec/controllers',
                           class_path,
                           "#{file_name}_controller_spec.rb")

      # View template for each action.
      actions.each do |action|
        path = File.join('app/views', class_path, file_name, "#{action}.html.erb")
        m.template 'view.html.erb', path,
          :assigns => { :action => action, :path => path }
      end

      m.dependency 'rubaidh_helper', [name] + @args
    end
  end

  protected
  def banner
    "Usage: #{$0} #{spec.name} ControllerName [action]..."
  end
end
