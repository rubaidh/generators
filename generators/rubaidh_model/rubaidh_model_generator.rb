require File.join(File.dirname(__FILE__), '..', 'rubaidh_named_base')

class RubaidhModelGenerator < RubaidhNamedBase
  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions class_name

      # Model, test, and fixture directories.
      m.directory File.join('app/models', class_path)
      m.directory File.join('spec/models', class_path)
      m.directory File.join('spec/exemplars', class_path)

      # Model class, unit test, and fixtures.
      m.template 'model.rb',      File.join('app/models', class_path, "#{file_name}.rb")
      m.template 'model_spec.rb',  File.join('spec/models', class_path, "#{file_name}_spec.rb")
      m.template 'model_exemplar.rb',  File.join('spec/exemplars', class_path, "#{file_name}_exemplar.rb")

      m.migration_template 'migration.rb', 'db/migrate', :assigns => {
        :migration_name => "Create#{class_name.pluralize.gsub(/::/, '')}"
      }, :migration_file_name => "create_#{file_path.gsub(/\//, '_').pluralize}"
    end
  end

  protected
  def banner
    "Usage: #{$0} #{spec.name} ModelName [field:type] ..."
  end
end