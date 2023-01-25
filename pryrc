# frozen_string_literal: true

require 'awesome_print'

Pry.print = proc { |output, value| output.puts value.ai({ limit: true }) }
Pry.config.editor = proc { |file, line| "code --wait --goto #{file}:#{line} --disable-workspace-trust" }
