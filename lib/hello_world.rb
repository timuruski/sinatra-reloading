# frozen_string_literal: true

require_relative "hello_world/version"

require "zeitwerk"

module HelloWorld
  Loader = Zeitwerk::Loader.for_gem.tap do |loader|
    loader.enable_reloading
    loader.setup
  end
end
