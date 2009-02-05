require File.join(File.dirname(__FILE__), '..', 'rubaidh_named_base')

class RubaidhScaffoldGenerator < RubaidhNamedBase
  attr_reader   :controller_name,
                :controller_class_path,
                :controller_file_path,
                :controller_class_nesting,
                :controller_class_nesting_depth,
                :controller_class_name,
                :controller_underscore_name,
                :controller_singular_name,
                :controller_plural_name
  alias_method  :controller_file_name,  :controller_underscore_name
  alias_method  :controller_table_name, :controller_plural_name

  def initialize(runtime_args, runtime_options = {})
    super

    if @name == @name.pluralize && !options[:force_plural]
      logger.warning "Plural version of the model detected, using singularized version.  Override with --force-plural."
      @name = @name.singularize
    end

    @controller_name = @name.pluralize

    base_name, @controller_class_path, @controller_file_path, @controller_class_nesting, @controller_class_nesting_depth = extract_modules(@controller_name)
    @controller_class_name_without_nesting, @controller_underscore_name, @controller_plural_name = inflect_names(base_name)
    @controller_singular_name=base_name.singularize
    if @controller_class_nesting.empty?
      @controller_class_name = @controller_class_name_without_nesting
    else
      @controller_class_name = "#{@controller_class_nesting}::#{@controller_class_name_without_nesting}"
    end
  end

  def manifest
    record do |m|
      # Check for class naming collisions.
      m.class_collisions "#{controller_class_name}Controller"

      # Controller, helper, views, test and stylesheets directories.
      m.directory(File.join('app/controllers', controller_class_path))
      m.directory(File.join('app/views', controller_class_path, controller_file_name))
      m.directory(File.join('spec/controllers', controller_class_path))

      [ :index, :show, :new, :edit ].each do |view|
        m.template(
          "view_#{view}.html.erb",
          File.join('app/views', controller_class_path, controller_file_name, "#{view}.html.erb")
        )
      end

      m.template(
        "partial_form.html.erb",
        File.join('app/views', controller_class_path, controller_file_name, "_form.html.erb")
      )

      m.template(
        "partial_layout.html.erb",
        File.join('app/views', controller_class_path, controller_file_name, "_#{plural_name}.html.erb")
      )

      m.template(
        "partial_model.html.erb",
        File.join('app/views', controller_class_path, controller_file_name, "_#{singular_name}.html.erb")
      )

      m.template(
        'controller.rb', File.join('app/controllers', controller_class_path, "#{controller_file_name}_controller.rb")
      )

      m.template('routing_spec.rb',    File.join('spec/controllers', controller_class_path, "#{controller_file_name}_routing_spec.rb"))
      m.template('controller_spec.rb', File.join('spec/controllers', controller_class_path, "#{controller_file_name}_controller_spec.rb"))

      m.route_resources controller_file_name

      m.dependency 'rubaidh_model', [name] + @args
      m.dependency 'rubaidh_helper', [plural_name] + @args
    end
  end

  protected
  def banner
    "Usage: #{$0} #{spec.name} ModelName [field:type] ..."
  end

  def model_name
    class_name.demodulize
  end
end
