# frozen_string_literal: true

# Locate the gem directory for the current Ruby version and add the awesome_print directory to load path
version_path_prefix = RbConfig::CONFIG['prefix']
base_version = File.basename(version_path_prefix).tap { |basename| basename[-1] = '0' }
gems_path = File.join(version_path_prefix, 'lib', 'ruby', 'gems', base_version, 'gems')
ap_gem_dir_name = Dir.new(gems_path).children.detect { |file| file.start_with? 'awesome_print' }

if ap_gem_dir_name.nil?
  puts 'Could not find AwesonePrint gem in this environment'
else
  $LOAD_PATH << File.join(gems_path, ap_gem_dir_name, 'lib')
  require 'awesome_print'

  Pry.print = proc { |output, value| output.puts value.ai({ limit: true }) }
  puts 'AwesomePrint available in this session'
end
Pry.config.editor = proc { |file, line| "code --wait --goto #{file}:#{line} --disable-workspace-trust" }
