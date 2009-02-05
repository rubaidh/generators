require File.join(File.dirname(__FILE__), '..', 'rubaidh_named_base')

class RubaidhControllerGenerator < RubaidhNamedBase
  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions "#{class_name}Controller", "#{class_name}Helper"

      # Controller, helper, views, and spec directories.
      m.directory File.join('app/controllers', class_path)
      m.directory File.join('app/helpers', class_path)
      m.directory File.join('app/views', class_path, file_name)
      m.directory File.join('spec/controllers', class_path)
      m.directory File.join('spec/helpers', class_path)

      # Controller spec, class, and helper.
      m.template 'controller.rb',
                 File.join('app/controllers',
                           class_path,
                           "#{file_name}_controller.rb")

      m.template 'controller:helper.rb',
                 File.join('app/helpers',
                           class_path,
                           "#{file_name}_helper.rb")

      m.template 'controller_spec.rb',
                 File.join('spec/controllers',
                           class_path,
                           "#{file_name}_controller_spec.rb")

      m.template 'helper_spec.rb',
                 File.join('spec/helpers',
                           class_path,
                           "#{file_name}_helper_spec.rb")

      # View template for each action.
      actions.each do |action|
        path = File.join('app/views', class_path, file_name, "#{action}.html.erb")
        m.template 'view.html.erb', path,
          :assigns => { :action => action, :path => path }
      end
    end
  end
end
