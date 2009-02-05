require File.join(File.dirname(__FILE__), '..', 'rubaidh_named_base')

class RubaidhHelperGenerator < RubaidhNamedBase
  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions "#{class_name}Helper"

      # Helper and helper test directories.
      m.directory File.join('app/helpers', class_path)
      m.directory File.join('spec/helpers', class_path)

      # Helper and helper test class.

      m.template 'helper.rb',
                  File.join('app/helpers',
                            class_path,
                            "#{file_name}_helper.rb")

      m.template 'helper_spec.rb',
                  File.join('spec/helpers',
                            class_path,
                            "#{file_name}_helper_spec.rb")

    end
  end
end
