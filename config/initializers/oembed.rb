# Tell oembed_links where to find the templates
OEmbed::TemplateResolver.template_root = File.join(RAILS_ROOT, "app", "views")

# Tell oembed_links where to find the yaml file
yaml_file = File.join(RAILS_ROOT, "config", "oembed_links.yml")
if File.exists?(yaml_file)
  OEmbed::register_yaml_file(yaml_file)
end