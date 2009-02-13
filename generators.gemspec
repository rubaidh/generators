spec = Gem::Specification.new do |s|
  s.name = 'generators'
  s.version = '1.0.0'
  s.date = '2009-02-13'
  s.authors = ['Graeme Mathieson', 'Rubaidh Ltd']
  s.email = 'support@rubaidh.com'
  s.rubyforge_project = 'rubaidh'
  s.homepage = 'http://rubaidh.com/portfolio/open-source'
  s.summary = '[Rails] Generators for building Ruby on Rails projects the Rubaidh Way'

  s.description = 'Generators for building Ruby on Rails projects the Rubaidh Way'

  s.files = %w(
    .gitignore MIT-LICENSE Rakefile README.rdoc TODO generators.gemspec
    generators/rubaidh_controller/rubaidh_controller_generator.rb
    generators/rubaidh_controller/templates/controller.rb
    generators/rubaidh_controller/templates/controller_spec.rb
    generators/rubaidh_controller/templates/view.html.erb
    generators/rubaidh_controller/USAGE
    generators/rubaidh_helper/rubaidh_helper_generator.rb
    generators/rubaidh_helper/templates/helper.rb
    generators/rubaidh_helper/templates/helper_spec.rb
    generators/rubaidh_helper/USAGE
    generators/rubaidh_model/rubaidh_model_generator.rb
    generators/rubaidh_model/templates/migration.rb
    generators/rubaidh_model/templates/model.rb
    generators/rubaidh_model/templates/model_spec.rb
    generators/rubaidh_model/USAGE
    generators/rubaidh_named_base.rb
    generators/rubaidh_scaffold/rubaidh_scaffold_generator.rb
    generators/rubaidh_scaffold/templates/controller.rb
    generators/rubaidh_scaffold/templates/controller_spec.rb
    generators/rubaidh_scaffold/templates/partial_form.html.erb
    generators/rubaidh_scaffold/templates/partial_layout.html.erb
    generators/rubaidh_scaffold/templates/partial_model.html.erb
    generators/rubaidh_scaffold/templates/routing_spec.rb
    generators/rubaidh_scaffold/templates/view_edit.html.erb
    generators/rubaidh_scaffold/templates/view_index.html.erb
    generators/rubaidh_scaffold/templates/view_new.html.erb
    generators/rubaidh_scaffold/templates/view_show.html.erb
    generators/rubaidh_scaffold/USAGE
  )
end